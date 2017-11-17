package ru.epavlov.bot;

import org.telegram.telegrambots.TelegramBotsApi;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.exceptions.TelegramApiRequestException;

import javax.annotation.PostConstruct;
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
           if (trackBot.isNotifyOnStart())
               trackBot.notifyAdmins("Started: " + trackBot.getBotUsername()+" on:"+ System.getProperty("os.name").toLowerCase());
        } catch (TelegramApiRequestException e) {
            e.printStackTrace();
        }
    }

}
