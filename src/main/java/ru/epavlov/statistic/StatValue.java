package ru.epavlov.statistic;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Created by Eugene on 17.11.2017.
 */
public class StatValue {
    private static final DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
    private String dateTime;
    private Object value;

    public StatValue() {
    }

    public StatValue(Object value) {
        this.value= value;
        dateTime= LocalDateTime.now().format(formatter);
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }
}
