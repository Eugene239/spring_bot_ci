package ru.epavlov.schedule;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import ru.epavlov.entity.MessageController;
import ru.epavlov.entity.TrackController;
import ru.epavlov.entity.UserController;
import ru.epavlov.statistic.StatisticController;

import javax.annotation.PostConstruct;

/**
 * Created by Eugene on 14.11.2017.
 */
@Component
public class Schedule {
    private static final Logger log = LogManager.getLogger(Schedule.class);
    @Autowired
    TrackController trackController;
    @Autowired
    UserController userController;
    @Autowired
    MessageController messageController;
    @Autowired
    StatisticController controller;



    @PostConstruct
    private void updateStat(){
        getStatistic();
    }

   // @Scheduled(cron = "*/10 * * * * *") //every 10 seconds
    @Scheduled(cron = "0 0 * * * *") //every 1 hour
    private void getStatistic(){
        trackController.getList().thenAcceptAsync(list->{
           controller.saveIfNotEquals(StatisticController.Stats.TRACKCNT,list.size());
        });
        userController.getList().thenAcceptAsync(list->
           controller.saveIfNotEquals(StatisticController.Stats.USERCNT,list.size())
        );
        controller.saveIfNotEquals(StatisticController.Stats.ERRORMESSAGES, messageController.errorCnt());
     //   controller.saveIfNotEquals(StatisticController.Stats.ERROR_MESSAGES, trackController.getList().join().size());
    }
}
