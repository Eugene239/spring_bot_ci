package ru.epavlov.entity;

import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 * Created by Eugene on 10.09.2017.
 */

public interface Controller <T,K> {
    CompletableFuture<T> get(K k);
    CompletableFuture<T> create(T t);
    void delete(K k);
    CompletableFuture<List<T>> getList();
  //  CompletableFuture<T> update(T t);


}
