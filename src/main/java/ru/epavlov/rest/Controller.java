package ru.epavlov.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

/**
 * Created by Eugene on 12.09.2017.
 */
@RestController
public class Controller {
    @GetMapping("/")
    public String sas(){
        return "greeting traveler";
    }
    @GetMapping("/stop")
    public void stop(){
        try {
            Runtime.getRuntime().exec("export pid=`pgrep -f spring_bot_ci`; kill -9 $pid");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
