package ru.epavlov.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.epavlov.entity.Track;
import ru.epavlov.entity.TrackController;

import java.util.List;
import java.util.concurrent.Future;


@RestController()
@RequestMapping("/track")
public class TrackRest {
    @Autowired
    TrackController trackController;

    @DeleteMapping
    void delete(@RequestParam("trackId") String trackId){
        trackController.delete(trackId);
    }


    @GetMapping
    Future<List<Track>> getList(){
       return trackController.getList();
    }
}
