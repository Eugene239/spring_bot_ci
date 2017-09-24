package ru.epavlov.bot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.telegram.telegrambots.api.methods.send.SendMessage;
import org.telegram.telegrambots.api.objects.Update;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.exceptions.TelegramApiException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Eugene on 24.09.2017.
 */

public class BotImpl extends TelegramLongPollingBot implements TelegramBot {
    private static Logger logger = LoggerFactory.getLogger(BotImpl.class);
    @Value("${track.key}")
    private String botToken;
    @Value("${bot.admins}")
    private String admin;
    @Value("${bot.name}")
    private String name;

    private List<String> admins;

    @PostConstruct
    void init() {
        admins = new ArrayList<>();
        admins.addAll(Arrays.asList(admin.split(",")));
        notifyAdmins("Started: " + name);

    }

    @Override
    public void onUpdateReceived(Update update) {
        if (update.hasMessage()) {
            logger.debug(update.getMessage().getChatId() + " " + update.getMessage().getText());
        }

    }

    @Override
    public String getBotUsername() {
        return name;
    }

    @Override
    public String getBotToken() {
        return botToken;
    }


    @Override
    public List<String> getAdmins() {
        return admins;
    }

    @Override
    public void notifyAdmins(String s) {
        admins.forEach(adminId -> {
            try {
                sendMessage(new SendMessage(adminId, s));
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }
        });
    }

    @PreDestroy
    void detroy() {
        notifyAdmins("Stopped: " + name);
    }

}
