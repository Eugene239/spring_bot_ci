package ru.epavlov.entity;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 * Created by Eugene on 10.09.2017.
 */
@Repository
public class UserController implements Controller<UserBot, Long> {
    @Autowired
    FirebaseDatabase firebaseDatabase;
    @Autowired
    TrackController trackController;

    @Override
    public CompletableFuture<UserBot> get(Long aLong) {
        CompletableFuture<UserBot> future = new CompletableFuture<>();
        firebaseDatabase.getReference("User/"+aLong).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists())
                    future.complete(dataSnapshot.getValue(UserBot.class));
                else future.complete(null);
            }
            @Override
            public void onCancelled(DatabaseError databaseError) {
                future.complete(null);
            }
        });
        return future;
    }

    @Override
    public CompletableFuture<UserBot> create(UserBot userBot) {
        firebaseDatabase.getReference("Track/"+userBot.getId()).setValue(userBot);
        CompletableFuture<UserBot> future = new CompletableFuture<>();
        firebaseDatabase.getReference("Track/"+userBot.getId()).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists())
                    future.complete(dataSnapshot.getValue(UserBot.class));
                else  future.complete(null);
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
                future.complete(null);
            }
        });
        return future;
    }

    @Override
    public void delete(Long aLong) {
        //delete user from tracks
        firebaseDatabase.getReference("Track/"+aLong).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists()) {
                    UserBot userBot = dataSnapshot.getValue(UserBot.class);
                    userBot.getTrackList().forEach((string, userTrack) ->
                         firebaseDatabase.getReference("Track/"+userTrack.getTrackId()).addListenerForSingleValueEvent(new ValueEventListener() {
                             @Override
                             public void onDataChange(DataSnapshot dataSnapshot) {
                                if (dataSnapshot.exists()){
                                    Track track = dataSnapshot.getValue(Track.class);
                                    track.getUsers().remove(String.valueOf(aLong.longValue()));
                                    trackController.create(track);
                                }
                             }

                             @Override
                             public void onCancelled(DatabaseError databaseError) {

                             }
                         })
                    );
                }
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {

            }
        });
        //delete user
        firebaseDatabase.getReference("Track/"+aLong).removeValue();
    }

    @Override
    public CompletableFuture<List<UserBot>> getList() {
        CompletableFuture<List<UserBot>> future = new CompletableFuture<>();
        List<UserBot> list = new ArrayList<>();
        firebaseDatabase.getReference("User").addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                dataSnapshot.getChildren().forEach(user -> {
                        UserBot userBot = user.getValue(UserBot.class);
                        list.add(userBot);
                });
                future.complete(list);
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
                future.complete(list);
            }
        });
        return future;
    }
}
