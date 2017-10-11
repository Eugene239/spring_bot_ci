package ru.epavlov.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.epavlov.bot.BotImpl;
import ru.epavlov.entity.TrackController;

import javax.ws.rs.Path;

@RestController("/track")
public class TrackRest {
    @Autowired
    BotImpl bot;

    @Autowired
    TrackController trackController;

    @DeleteMapping
    void delete(@RequestParam("trackId") String trackId){
        bot.notifyAdmins("delete "+trackId);
        trackController.delete(trackId);
    }
}
