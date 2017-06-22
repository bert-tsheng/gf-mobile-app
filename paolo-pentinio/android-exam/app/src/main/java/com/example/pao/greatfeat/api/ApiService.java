package com.example.pao.greatfeat.api;

import com.example.pao.greatfeat.models.NewsListResponse;

import retrofit2.http.GET;
import rx.Observable;

/**
 * Created by Pao on 22/06/2017.
 */

public interface ApiService {

    @GET("v1/articles?source=bbc-sport&sortBy=top&apiKey=c607253b44a94b1987129204f3596142")
    Observable<NewsListResponse> getNewsList();

}