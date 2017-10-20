package ru.epavlov.rest;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.epavlov.entity.Track;
import ru.epavlov.entity.TrackController;

import java.util.List;
import java.util.concurrent.Future;


@RestController()
@RequestMapping("/track")
public class TrackRest {
    private static final Logger log = LogManager.getLogger(TrackRest.class);
    @Autowired
    TrackController trackController;

    @DeleteMapping
    void delete(@RequestParam("trackId") String trackId){
        log.debug("Delete track "+trackId);
        trackController.delete(trackId);
    }


    @GetMapping
    Future<List<Track>> getList(){
        log.debug("Get track list");
        return trackController.getList();
    }
}
