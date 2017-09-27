package ru.epavlov.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import ru.epavlov.entity.MessageList;

/**
 * Created by Eugene on 12.09.2017.
 */
@Controller
public class ControllerMVC {
    @Autowired
    MessageList messageList;
    
    
    @GetMapping("/")
    public String sas(Model model){
        //ModelAndView mav= new ModelAndView("index");
        //mav.addAttribute("kek","privet");
      //  mav.addObject("kek","privet");
       // return mav;
        model.addAttribute("list",messageList.getList());
        return "index";
    }

    @GetMapping("/stop")
    public void stop(){
       System.exit(0);
    }
}
