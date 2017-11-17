package ru.epavlov.statistic;

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

    public enum Stats {
        USERCNT, TRACKCNT, ERRORMESSAGES
    }

    @Autowired
    private FirebaseDatabase firebaseDatabase;


    public void saveIfNotEquals(Stats statsEnum, Object value) {
        log.debug("start saveIfNotEquals: " + statsEnum + " value:" + value.toString());
        firebaseDatabase.getReference(PATH.concat("/").concat(statsEnum.name()))
                .orderByKey().limitToLast(1).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists()) {
                    try {
                        StatValue data = dataSnapshot.getChildren().iterator().next().getValue(StatValue.class);
                        if (!value.toString().equals(data.getValue().toString())){
                            log.debug(statsEnum.name()+" saving value "+data.getValue()+"!="+value);
                            firebaseDatabase.getReference(PATH.concat("/").concat(statsEnum.name())).push().setValue(new StatValue(value));
                        }else {
                            log.debug(statsEnum.name()+ " no changes");
                        }
                    } catch (Exception e) {
                        log.error(e);
                    }
                }else {
                    log.debug("creating first stat");
                    firebaseDatabase.getReference(PATH.concat("/").concat(statsEnum.name())).push().setValue(new StatValue(value));
                    log.debug("saved");
                }

            }

            @Override
            public void onCancelled(DatabaseError databaseError) {

            }
        });
    }

    public void save(Stats statsEnum, Object value) {
        log.debug("start saving: " + statsEnum + " value:" + value.toString());
        firebaseDatabase.getReference(PATH.concat("/").concat(statsEnum.name()))
                .push().setValue(new StatValue(value));

    }
    public CompletableFuture<List<StatValue>> getListValues(Stats enumStat){
        CompletableFuture<List<StatValue>> statisticCompletableFuture =new CompletableFuture<>();
        List<StatValue> list =new ArrayList<>();
        firebaseDatabase.getReference(PATH+"/"+enumStat).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                log.debug("list size:" + dataSnapshot.getChildrenCount());
                dataSnapshot.getChildren().forEach(stat -> {
                    try {
                        list.add(stat.getValue(StatValue.class));
                    } catch (Exception e) {
                        log.error(e.getMessage() + " \n" + stat.getValue().toString() + " \n", e);
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

//    public  CompletableFuture<List<Statistic>> getList(){
//        log.debug("getList");
//        CompletableFuture<List<Statistic>> statisticCompletableFuture =new CompletableFuture<>();
//        List<Statistic> list =new ArrayList<>();
//        firebaseDatabase.getReference(PATH).addListenerForSingleValueEvent(new ValueEventListener() {
//            @Override
//            public void onDataChange(DataSnapshot dataSnapshot) {
//                log.debug("list size:"+ dataSnapshot.getChildrenCount());
//                dataSnapshot.getChildren().forEach(stat->{
//                    try {
//                        list.add(stat.getValue(Statistic.class));
//                    } catch (Exception e){
//                        log.error(e.getMessage()+" \n"+stat.getValue().toString()+ " \n",e);
//                    }
//                });
//                log.debug("complete");
//                statisticCompletableFuture.complete(list);
//            }
//
//            @Override
//            public void onCancelled(DatabaseError databaseError) {
//                statisticCompletableFuture.complete(list);
//            }
//        });
//        return statisticCompletableFuture;
//    }
}
