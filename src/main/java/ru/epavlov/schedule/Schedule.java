package ru.epavlov.schedule;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import ru.epavlov.statistic.Statistic;
import ru.epavlov.statistic.StatisticController;
import ru.epavlov.entity.TrackController;
import ru.epavlov.entity.UserController;

import java.time.LocalDateTime;

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
    StatisticController controller;

   // @Scheduled(cron = "*/10 * * * * *") //every 10 seconds
    @Scheduled(cron = "0 0 * * * *") //every 1 hour
    private void getStatistic(){
        Statistic statistic =new Statistic();
        statistic.setTrackCnt(trackController.getList().join().size());
        statistic.setUserCnt(userController.getList().join().size());
        statistic.setLDT(LocalDateTime.now());
        controller.save(statistic);
    }
}
