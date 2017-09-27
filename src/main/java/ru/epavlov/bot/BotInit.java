package ru.epavlov.bot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.telegram.telegrambots.TelegramBotsApi;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.exceptions.TelegramApiException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

/**
 * Created by Eugene on 24.09.2017.
 */
public class BotInit {
    private TelegramBotsApi telegramBotsApi;

    private final TelegramLongPollingBot bot;

    @Autowired
    public BotInit(TelegramLongPollingBot bot) {
        this.bot = bot;
    }


    @PostConstruct
    private void init(){
        telegramBotsApi = new TelegramBotsApi();
        try {
            telegramBotsApi.registerBot(bot);
        }catch (TelegramApiException e){
            e.printStackTrace();
        }
    }

    @PreDestroy
    private void destroy(){
        bot.onClosing();
    }
}
