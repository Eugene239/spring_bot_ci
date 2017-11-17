package ru.epavlov.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Eugene on 17.11.2017.
 */
@RestController
public class ConfigRest {

    @RequestMapping("favicon.ico")
    String favicon() {
        return "forward:/resources/images/favicon.ico";
    }

}
