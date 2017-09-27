package ru.epavlov.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.epavlov.entity.MessageList;

/**
 * Created by Eugene on 12.09.2017.
 */
@Controller
public class ControllerMVC {
    @Autowired
    MessageList messageList;
//    @Value("bot_version")
//    String version;
    
    @GetMapping("/")
    public String sas(Model model){
        //ModelAndView mav= new ModelAndView("index");
        //mav.addAttribute("kek","privet");
      //  mav.addObject("kek","privet");
       // return mav;
        model.addAttribute("list",messageList.getList());
     //   model.addAttribute("version",version);
        return "index";
    }

    @GetMapping("/stop")
    public void stop(){
       System.exit(0);
    }
}
