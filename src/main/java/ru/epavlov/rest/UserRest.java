package ru.epavlov.rest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.*;
import ru.epavlov.bot.TrackBot;
import ru.epavlov.entity.UserBot;
import ru.epavlov.entity.UserController;

import javax.annotation.PostConstruct;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by Eugene on 15.11.2017.
 */
@RestController(value = "userRest")
@RequestMapping("/users")
public class UserRest {
    private static final Logger log = LogManager.getLogger(UserRest.class);
    @Autowired
    private UserController userController;
    @Autowired
    private ApplicationContext context;
    private TrackBot trackBot;

    @PostConstruct
    void init(){
        try{
            trackBot  = (TrackBot) context.getBean("bot");
        }catch (Exception ignored){

        }
    }

    @DeleteMapping("/deleteGarbage")
    public int deleteGarbage(){
        log.info("/deleteGarbage");
        List<UserBot> garbage=  userController.getList().join().stream().filter(userBot -> !userBot.isActive() || userBot.getTrackList().size()==0).collect(Collectors.toList());
        garbage.parallelStream().forEach(userBot -> userController.delete(userBot.getId()));
        if (trackBot!=null) {
            trackBot.notifyAdmins("/user/deleteGarbage deleted: " + garbage.size());
        }
        return garbage.size();
    }

    @GetMapping("/cnt")
    public int size(){
        return userController.getList().join().size();
    }

    @GetMapping("/{id}")
    public UserBot getUser(@PathVariable Long id){
        log.info("getUser: "+id);
        UserBot userBot= userController.get(id).join();
        log.info(userBot);
        return userBot;
    }
    @GetMapping("/top")
    public List<UserBot> getTop(){
        return userController.getList()
                .join().stream()
                .sorted(((Comparator<UserBot>)
                        (o1, o2) -> Integer.compare(o1.getTrackList().size(), o2.getTrackList().size())).reversed())
                .limit(10).collect(Collectors.toList());
    }


}
