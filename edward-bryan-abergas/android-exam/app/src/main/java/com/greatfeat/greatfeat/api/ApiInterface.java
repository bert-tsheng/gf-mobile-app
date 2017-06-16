package com.greatfeat.greatfeat.api;

import com.greatfeat.greatfeat.constants.Constants;
import com.greatfeat.greatfeat.model.ApiResponse;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;


/**
 * Created by edwardbryanabergas on 15/06/2017.
 */

public interface ApiInterface {

    @GET(Constants.NEWS_API_ARTICLES)
    Call<ApiResponse> getSources(@Query(Constants.NEWS_API_ARTICLES_PARAM_SOURCE) String source,
                                 @Query(Constants.NEWS_API_ARTICLES_PARAM_API_KEY)  String apiKey);
}
