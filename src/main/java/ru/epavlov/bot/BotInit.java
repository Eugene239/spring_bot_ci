package ru.epavlov.bot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.telegram.telegrambots.ApiContextInitializer;
import org.telegram.telegrambots.TelegramBotsApi;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.exceptions.TelegramApiException;
import org.telegram.telegrambots.exceptions.TelegramApiRequestException;
import org.telegram.telegrambots.generics.LongPollingBot;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Eugene on 24.09.2017.
 */
public class BotInit {
    private TelegramBotsApi api;
    private List<TelegramLongPollingBot> botList;

    @PostConstruct
    private void init(){
        api = new TelegramBotsApi();
        botList = new ArrayList<>();
    }


    public void addBot(TrackBot trackBot){
        try {
            api.registerBot(trackBot);
            botList.add(trackBot);
            trackBot.notifyAdmins("Started: " + trackBot.getBotUsername()+" on:"+ System.getProperty("os.name").toLowerCase());
        } catch (TelegramApiRequestException e) {
            e.printStackTrace();
        }
    }

}
