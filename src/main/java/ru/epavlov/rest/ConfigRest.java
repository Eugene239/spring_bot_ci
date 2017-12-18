package ru.epavlov.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Eugene on 17.11.2017.
 */
@Controller
public class ConfigRest {

    @RequestMapping("favicon.ico")
    String favicon() {
        return "forward: /resources/images/favicon.ico";
    }

    @GetMapping("/")
    public String main() {
        return "index";
    }
    @GetMapping("/clearDB")
    public String delete() {
        return "cleardb/clear";
    }
}
