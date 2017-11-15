package ru.epavlov.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.epavlov.bot.TrackBot;
import ru.epavlov.entity.UserBot;
import ru.epavlov.entity.UserController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by Eugene on 15.11.2017.
 */
@RestController()
@RequestMapping("/users")
public class UserRest {
    @Autowired
    private UserController userController;
    @Autowired
    private TrackBot trackBot;
    @DeleteMapping("/deleteGarbage")
    public void deleteGarbage(){
        List<UserBot> garbage=  userController.getList().join().stream().filter(userBot -> !userBot.isActive() || userBot.getTrackList().size()==0).collect(Collectors.toList());
        garbage.parallelStream().forEach(userBot -> userController.delete(userBot.getId()));
        trackBot.notifyAdmins("/user/deleteGarbage deleted: "+garbage.size());
    }
}
