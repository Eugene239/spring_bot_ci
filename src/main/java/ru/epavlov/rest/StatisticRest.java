package ru.epavlov.rest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.epavlov.statistic.StatValue;
import ru.epavlov.statistic.StatisticController;

import java.util.ArrayList;
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

    @GetMapping("/{path}")
    public List<StatValue> getList(@PathVariable(value = "path") String path){
        List<StatValue> list = new ArrayList<>();
        try{
            StatisticController.Stats statValue= StatisticController.Stats.valueOf(path);
            list.addAll(controller.getListValues(statValue).join());
        }catch (Exception e){
            log.error(e.getMessage(),e);
        }
         return list;
    }
}
