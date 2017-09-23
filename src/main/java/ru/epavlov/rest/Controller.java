package ru.epavlov.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Eugene on 12.09.2017.
 */
@RestController
public class Controller {
    @GetMapping("/")
    public String sas(){
        return "greeting traveler";
    }
}
