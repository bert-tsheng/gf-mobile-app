package com.example.pao.greatfeat.deps;

import com.example.pao.greatfeat.api.ApiModule;
import com.example.pao.greatfeat.news.NewsActivity;
import com.example.pao.greatfeat.news.NewsItem;

import javax.inject.Singleton;

import dagger.Component;

/**
 * Created by Pao on 22/06/2017.
 */

@Singleton
@Component(modules = {ApiModule.class,})
public interface Deps {
    void inject(NewsActivity homeActivity);
    void inject(NewsItem newsItem);
}
