package ru.epavlov.entity;


import org.springframework.stereotype.Controller;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MessageList {

    private ArrayList<String> messageList;
    @PostConstruct
    void init(){
        messageList= new ArrayList<>();
    }

    public void pushMessage(long id, String s){
        messageList.add(id+": "+s);
    }
    public List<String> getList(){
        return messageList;
    }
}
