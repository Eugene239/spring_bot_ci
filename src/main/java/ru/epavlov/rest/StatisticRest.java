package ru.epavlov.rest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.epavlov.statistic.Statistic;
import ru.epavlov.statistic.StatisticController;

import java.util.List;

/**
 * Created by Eugene on 14.11.2017.
 */
@RestController()
@RequestMapping("statistic")
public class StatisticRest {
    private static final Logger log = LogManager.getLogger(StatisticRest.class);
    @Autowired
    StatisticController controller;

    @GetMapping()
    public List<Statistic> getList(){
         List<Statistic> list= controller.getList().join();
         log.debug("completed");
         return list;
    }
}
