package ru.epavlov.rest;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.epavlov.bot.TrackBot;
import ru.epavlov.entity.Track;
import ru.epavlov.entity.TrackController;

import java.util.List;
import java.util.concurrent.Future;
import java.util.stream.Collectors;


@RestController()
@RequestMapping("/track")
public class TrackRest {
    private static final Logger log = LogManager.getLogger(TrackRest.class);
    @Autowired
    TrackController trackController;
    @Autowired
    TrackBot trackBot;
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
    @DeleteMapping("/deleteUNUSED")
    void deleteUnused(){
        List<Track> unused= trackController.getList().join().stream()
                .filter(track -> track.getUsers().size()==0).collect(Collectors.toList());
        unused.parallelStream().forEach(track -> trackController.delete(track.getId()));
        trackBot.notifyAdmins("Deleted: "+unused.size()+" unused tracks");
    }
    @DeleteMapping("/deleteSIGNIN")
    void deleteSIGNIN(){
        List<Track> signed= trackController.getList().join().stream()
                .filter(track -> "SIGNIN".equals(track.getStatus())).collect(Collectors.toList());
        signed.parallelStream().forEach(track -> trackController.delete(track.getId()));
        trackBot.notifyAdmins("Deleted: "+signed.size()+" signed tracks");
    }
}
