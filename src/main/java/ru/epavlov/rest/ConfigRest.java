package ru.epavlov.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Eugene on 17.11.2017.
 */
@Controller
public class ConfigRest {

    @RequestMapping("favicon.ico")
    String favicon() {
        return "forward: /resources/images/favicon.ico";
    }

}
