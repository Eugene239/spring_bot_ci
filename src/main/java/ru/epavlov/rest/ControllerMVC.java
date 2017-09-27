package ru.epavlov.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.epavlov.entity.Track;
import ru.epavlov.entity.TrackController;

import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeoutException;

/**
 * Created by Eugene on 12.09.2017.
 */
@Controller
public class ControllerMVC {

//    @Autowired
//    MessageList messageList;

    @Autowired
    TrackController trackController;

    @Value("${bot_version}")
    String version;
    
    @GetMapping("/")
    public String sas(Model model) throws InterruptedException, ExecutionException, TimeoutException {
        //ModelAndView mav= new ModelAndView("index");
        //mav.addAttribute("kek","privet");
      //  mav.addObject("kek","privet");
       // return mav;
        List<Track> list = trackController.getList().join();
        model.addAttribute("version",version);
        model.addAttribute("list",list);
        model.addAttribute("size",list.size());
     //   model.addAttribute("version",version);
        return "index";
    }

    @GetMapping("/stop")
    public void stop(){
       System.exit(0);
    }
}
