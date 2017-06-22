package com.example.pao.greatfeat.news;

import com.example.pao.greatfeat.models.NewsListResponse;

/**
 * Created by Pao on 22/06/2017.
 */

public interface NewsView {

    void showWait();

    void removeWait();

    void onFailure(String appErrorMessage);

    void getityListSuccess(NewsListResponse cityListResponse);
}
