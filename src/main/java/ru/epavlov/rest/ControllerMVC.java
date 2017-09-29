package ru.epavlov.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.epavlov.entity.Track;
import ru.epavlov.entity.TrackController;
import ru.epavlov.entity.UserBot;
import ru.epavlov.entity.UserController;

import java.util.Comparator;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeoutException;
import java.util.stream.Collectors;

/**
 * Created by Eugene on 12.09.2017.
 */
@Controller
public class ControllerMVC {

//    @Autowired
//    MessageList messageList;

    @Autowired
    TrackController trackController;

    @Autowired
    UserController userController;
    @Value("${bot_version}")
    String version;
    
    @GetMapping("/")
    public String main(Model model) throws InterruptedException, ExecutionException, TimeoutException {
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
    @GetMapping("/trackList")
    public String getTrackList(Model model) throws InterruptedException, ExecutionException, TimeoutException {
        return main(model);
    }

    @GetMapping("/userList")
    public String getUserList(Model model) throws InterruptedException, ExecutionException, TimeoutException {
        model.addAttribute("version",version);
        List<UserBot> list = userController.getList()
                .join()
                .stream()
                .filter(userBot ->userBot.isActive() &&  userBot.getTrackList().size()>0)
                .collect(Collectors.toList());
        list.sort(Comparator.comparingLong(o -> o.getTrackList().size()));
        model.addAttribute("userList",list);
        return "user/user_list";
    }



    @GetMapping("/user/{id}")
    public String getUser(@PathVariable("id") Long id,  Model model) throws InterruptedException, ExecutionException, TimeoutException {
        model.addAttribute("version",version);
        UserBot userBot = userController.get(id).join();
       // System.out.println(userBot);
        model.addAttribute("user",userBot);
        return "user/user";
    }
    @GetMapping("/track/{id}")
    public String getTrack(@PathVariable("id") String id,  Model model) throws InterruptedException, ExecutionException, TimeoutException {
        model.addAttribute("version",version);
        Track track = trackController.get(id).join();
        //System.out.println(userBot);
        model.addAttribute("track",track);
        return "track/track";
    }

    @GetMapping("/stop")
    public void stop(){
       System.exit(0);
    }
}
