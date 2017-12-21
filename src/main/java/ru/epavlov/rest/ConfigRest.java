package ru.epavlov.rest;

import org.springframework.security.access.prepost.PreAuthorize;
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
    @PreAuthorize(value = "hasRole('ROLE_ADMIN')")
    public String delete() {
        return "cleardb/clear";
    }

    @GetMapping("/tracks")
   // @PreAuthorize(value = "hasRole('ROLE_ADMIN')")
    public String tracksPage() {
        return "tracks";
    }
}
