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
public class TrackController implements Controller<Track,String> {
    @Autowired
    FirebaseDatabase firebaseDatabase;
    @Autowired
    UserController userController;

    @Override
    public CompletableFuture<Track> get(String trackId) {
        CompletableFuture<Track> future = new CompletableFuture<>();
        firebaseDatabase.getReference("Track/"+trackId).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists()){
                    future.complete(dataSnapshot.getValue(Track.class));
                }else {
                    future.complete(null);
                }
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
                future.complete(null);
            }
        });
        return future;
    }

    @Override
    public CompletableFuture<Track> create(Track track) {
        firebaseDatabase.getReference("Track/"+track.getId()).setValue(track);
        return get(track.getId());
    }

    @Override
    public void delete(String trackId) {
        firebaseDatabase.getReference("Track/"+trackId).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists()) {
                    Track track = dataSnapshot.getValue(Track.class);
                    track.getUsers().forEach((s, userId) -> {
                        userController.get(userId).thenAcceptAsync(userBot -> {
                            userBot.getTrackList().remove(userId);
                            userController.create(userBot);
                        });
                    });
                }
                firebaseDatabase.getReference("Track/"+trackId).removeValue();
            }
            @Override
            public void onCancelled(DatabaseError databaseError) {

            }
        });
    }

    @Override
    public CompletableFuture<List<Track>> getList() {
        CompletableFuture<List<Track>> future = new CompletableFuture<>();
        List<Track> list = new ArrayList<>();
        firebaseDatabase.getReference("Track").addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                dataSnapshot.getChildren().forEach(trackSnapshot -> {
                    try {
                        list.add(trackSnapshot.getValue(Track.class));
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    }
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
