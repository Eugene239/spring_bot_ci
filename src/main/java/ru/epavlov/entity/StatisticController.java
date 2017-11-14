package ru.epavlov.entity;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 * Created by Eugene on 14.11.2017.
 */
@Repository
public class StatisticController {
    private static final Logger log = LogManager.getLogger(StatisticController.class);
    private static final String PATH = "STATISTIC";
    @Autowired
    private FirebaseDatabase firebaseDatabase;

    public  void save(Statistic statistic){
        log.debug("start saving: "+statistic.toString());
        //get last value
        firebaseDatabase.getReference().child(PATH).orderByKey().limitToLast(1).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists()) {

                    log.debug("last statistic: " + dataSnapshot.getValue().toString());
                    Statistic lastValue = dataSnapshot.getChildren().iterator().next().getValue(Statistic.class);
                    if (lastValue.getUserCnt() != statistic.getUserCnt() || lastValue.getTrackCnt() != statistic.getTrackCnt()) {
                        firebaseDatabase.getReference(PATH).push().setValue(statistic);
                        log.debug("added new statistic");
                    } else {
                        log.debug("no changes");
                    }
                }else{
                    log.debug("creating first stat");
                    firebaseDatabase.getReference(PATH ).push().setValue(statistic);
                    log.debug("saved");
                }
            }
            @Override
            public void onCancelled(DatabaseError databaseError) {
                log.error(databaseError.getMessage(), databaseError.toException());
            }
        });

    }
    public  CompletableFuture<List<Statistic>> getList(){
        log.debug("getList");
        CompletableFuture<List<Statistic>> statisticCompletableFuture =new CompletableFuture<>();
        List<Statistic> list =new ArrayList<>();
        firebaseDatabase.getReference(PATH).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                log.debug("list size:"+ dataSnapshot.getChildrenCount());
                dataSnapshot.getChildren().forEach(stat->{
                    try {
                        list.add(stat.getValue(Statistic.class));
                    } catch (Exception e){
                        log.error(e.getMessage()+" \n"+stat.getValue().toString()+ " \n",e);
                    }
                });
                log.debug("complete");
                statisticCompletableFuture.complete(list);
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
                statisticCompletableFuture.complete(list);
            }
        });
        return statisticCompletableFuture;
    }
}
