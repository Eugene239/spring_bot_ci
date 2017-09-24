package ru.epavlov.bot;

import java.util.List;

/**
 * Created by Eugene on 24.09.2017.
 */
public interface TelegramBot  {
    public List<String> getAdmins();
    public void notifyAdmins(String s);

}
