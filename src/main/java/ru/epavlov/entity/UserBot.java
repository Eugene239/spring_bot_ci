package ru.epavlov.entity;

import com.google.firebase.database.Exclude;

import java.util.HashMap;

/**
 * Created by Eugene on 10.09.2017.
 */
public class UserBot {
    public  static  final String PATH = "User";

    private Long id;
    private String user_name;
    private String createdTime;
    private String first_name;
    private String last_name;
    private boolean active;
    private String lastMessageTime;
    private String fio;
    private HashMap<String,UserTrack> trackList= new HashMap<>();

    public HashMap<String, UserTrack> getTrackList() {
        return trackList;
    }

    public UserBot() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getLastMessageTime() {
        return lastMessageTime;
    }

    public void setLastMessageTime(String lastMessageTime) {
        this.lastMessageTime = lastMessageTime;
    }

    public void setTrackList(HashMap<String, UserTrack> trackList) {
        this.trackList = trackList;
    }

    public String getFio() {
        String fio = "";
        if (getUser_name()!=null && !getUser_name().isEmpty()) return getUser_name();
        if (getFirst_name()!=null && !getFirst_name().isEmpty()) fio=getFirst_name();
        if (getLast_name()!=null && !getLast_name().isEmpty()) fio+=" "+getLast_name();
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    @Override
    public String toString() {
        return "UserBot{" +
                "id=" + id +
                ", user_name='" + user_name + '\'' +
                ", createdTime='" + createdTime + '\'' +
                ", first_name='" + first_name + '\'' +
                ", last_name='" + last_name + '\'' +
                ", active=" + active +
                ", lastMessageTime='" + lastMessageTime + '\'' +
                ", trackList=" + trackList +
                '}';
    }
}
