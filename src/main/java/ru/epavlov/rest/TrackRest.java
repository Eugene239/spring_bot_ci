package ru.epavlov.rest;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.*;
import ru.epavlov.bot.TrackBot;
import ru.epavlov.entity.Track;
import ru.epavlov.entity.TrackController;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.concurrent.Future;
import java.util.stream.Collectors;


@RestController(value = "trackRest")
@RequestMapping("/track")
public class TrackRest {
    private static final Logger log = LogManager.getLogger(TrackRest.class);
    @Autowired
    TrackController trackController;
    @Autowired
    ApplicationContext context;

    TrackBot trackBot;

    @PostConstruct
    void init() {
        try{
            trackBot  = (TrackBot) context.getBean("bot");
        }catch (Exception ignored){

        }
    }

    @DeleteMapping
    public void delete(@RequestParam("trackId") String trackId) {
        log.debug("Delete track " + trackId);
        trackController.delete(trackId);
    }


    @GetMapping
    public Future<List<Track>> getList() {
        log.debug("Get track list");
        return trackController.getList();
    }
    public int size() {
        return trackController.getList().join().size();
    }

    @DeleteMapping("/deleteUNUSED")
    public void  deleteUnused() {
        log.info("deleteUNUSED");
        List<Track> unused = trackController.getList().join().stream()
                .filter(track -> track.getUsers().size() == 0).collect(Collectors.toList());
        unused.parallelStream().forEach(track -> trackController.delete(track.getId()));
        if (trackBot != null) trackBot.notifyAdmins("Deleted: " + unused.size() + " unused tracks");
    }

    @DeleteMapping("/deleteSIGNIN")
    public void deleteSIGNIN() {
        log.info("deleteSIGNIN");
        List<Track> signed = trackController.getList().join().stream()
                .filter(track -> "SIGNIN".equals(track.getStatus())).collect(Collectors.toList());
        signed.parallelStream().forEach(track -> trackController.delete(track.getId()));
        if (trackBot != null) trackBot.notifyAdmins("Deleted: " + signed.size() + " signed tracks");
    }
}
