package com.example.pao.greatfeat.api;

import android.util.Log;

import com.example.pao.greatfeat.models.NewsListResponse;

import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Func1;
import rx.schedulers.Schedulers;

/**
 * Created by Pao on 22/06/2017.
 */

public class Service {
    private final ApiService apiService;

    public Service(ApiService apiService) {
        this.apiService = apiService;
    }

    public Subscription getNewsList(final GetNewsListCallback callback) {

        return apiService.getNewsList()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .onErrorResumeNext(new Func1<Throwable, Observable<? extends NewsListResponse>>() {
                    @Override
                    public Observable<? extends NewsListResponse> call(Throwable throwable) {
                        return Observable.error(throwable);
                    }
                })
                .subscribe(new Subscriber<NewsListResponse>() {

                    @Override
                    public void onCompleted() { }

                    @Override
                    public void onError(Throwable e) {
                        e.printStackTrace();
                        callback.onError(new ApiError(e));
                    }

                    @Override
                    public void onNext(NewsListResponse newsListResponse) {
                        callback.onSuccess(newsListResponse);
                    }
                });
    }

    public interface GetNewsListCallback{
        void onSuccess(NewsListResponse newsListResponse);

        void onError(ApiError apiError);
    }
}

