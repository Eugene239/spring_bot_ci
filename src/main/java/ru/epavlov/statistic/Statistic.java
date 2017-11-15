package ru.epavlov.statistic;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Created by Eugene on 14.11.2017.
 */
public class Statistic {
    private int userCnt;
    private int trackCnt;
    private LocalDateTime localDateTime;
    public int getUserCnt() {
        return userCnt;
    }

    public void setUserCnt(int userCnt) {
        this.userCnt = userCnt;
    }

    public int getTrackCnt() {
        return trackCnt;
    }

    public void setTrackCnt(int trackCnt) {
        this.trackCnt = trackCnt;
    }

    public String getLocalDateTime() {
        return localDateTime.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
    }

    public void setLocalDateTime(String localDateTime) {
        this.localDateTime = LocalDateTime.parse(localDateTime);
    }
    public void setLDT(LocalDateTime localDateTime) {
        this.localDateTime = localDateTime;
    }

    @Override
    public String toString() {
        return "Statistic{" +
                "userCnt=" + userCnt +
                ", trackCnt=" + trackCnt +
                ", localDateTime=" + localDateTime.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME) +
                '}';
    }
}
