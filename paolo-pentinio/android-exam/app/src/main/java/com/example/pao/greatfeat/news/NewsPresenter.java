package com.example.pao.greatfeat.news;

import com.example.pao.greatfeat.api.ApiError;
import com.example.pao.greatfeat.api.Service;
import com.example.pao.greatfeat.models.NewsListResponse;

import rx.Subscription;
import rx.subscriptions.CompositeSubscription;

/**
 * Created by Pao on 22/06/2017.
 */

public class NewsPresenter {
    private final Service service;
    private final NewsView view;
    private CompositeSubscription subscriptions;

    public NewsPresenter(Service service, NewsView view) {
        this.service = service;
        this.view = view;
        this.subscriptions = new CompositeSubscription();
    }

    public void getCityList() {
        view.showWait();

        Subscription subscription = service.getNewsList(new Service.GetNewsListCallback() {
            @Override
            public void onSuccess(NewsListResponse cityListResponse) {
                view.removeWait();
                view.getityListSuccess(cityListResponse);
            }

            @Override
            public void onError(ApiError apiError) {
                view.removeWait();
                view.onFailure(apiError.getAppErrorMessage());
            }

        });

        subscriptions.add(subscription);
    }
    public void onStop() {
        subscriptions.unsubscribe();
    }
}
