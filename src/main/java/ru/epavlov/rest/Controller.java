package ru.epavlov.rest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Eugene on 12.09.2017.
 */
@RestController
public class Controller {
    @GetMapping("/")
    public String sas(Model model){
        model.addAttribute("kek","privet");
        return "index";
    }

    @GetMapping("/stop")
    public void stop(){
       System.exit(0);
    }
}
