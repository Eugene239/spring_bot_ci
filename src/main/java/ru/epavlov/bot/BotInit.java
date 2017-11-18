package ru.epavlov.bot;

import org.springframework.beans.factory.annotation.Value;
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

    @Value("${bot.enabled}")
    boolean botEnabled;

    @PostConstruct
    private void init() {
        api = new TelegramBotsApi();
        botList = new ArrayList<>();
    }


    public void addBot(TrackBot trackBot) {
        if (botEnabled) {
            try {
                api.registerBot(trackBot);
                botList.add(trackBot);
                if (trackBot.isNotifyOnStart())
                    trackBot.notifyAdmins("Started: " + trackBot.getBotUsername() + " on:" + System.getProperty("os.name").toLowerCase());
            } catch (TelegramApiRequestException e) {
                e.printStackTrace();
            }
        }
    }

}
