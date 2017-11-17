package ru.epavlov.entity;


import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.concurrent.CompletableFuture;

/**
 * Created by Eugene on 17.11.2017.
 */
@Repository
public class MessageController {
    private static final Logger log = LogManager.getLogger(MessageController.class);

    @Autowired
    FirebaseDatabase database;
    private static  final String PATH = "Message";
    private static final String ERROR_PATH= "ERROR";

    public long errorCnt(){
        log.debug("errorCnt()");
        CompletableFuture<Long> completableFuture = new CompletableFuture<>();
        database.getReference(PATH+"/"+ERROR_PATH).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                log.debug("errorCnt() completed: "+dataSnapshot.getChildrenCount());
                completableFuture.complete(dataSnapshot.getChildrenCount());
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
                completableFuture.complete(0L);
                log.error(databaseError.getMessage(),databaseError.toException());
            }
        });
        return completableFuture.join();
    }

}
