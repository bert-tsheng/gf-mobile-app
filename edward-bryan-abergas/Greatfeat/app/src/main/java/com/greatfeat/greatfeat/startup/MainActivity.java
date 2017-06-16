package com.greatfeat.greatfeat.startup;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.MenuItem;
import android.widget.LinearLayout;

import com.greatfeat.greatfeat.api.ApiClient;
import com.greatfeat.greatfeat.api.ApiInterface;
import com.greatfeat.greatfeat.R;
import com.greatfeat.greatfeat.api.OnSingleItemClickListener;
import com.greatfeat.greatfeat.constants.Constants;
import com.greatfeat.greatfeat.model.ApiResponse;
import com.greatfeat.greatfeat.model.Articles;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Created by edwardbryanabergas on 15/06/2017.
 */

public class MainActivity extends AppCompatActivity implements OnSingleItemClickListener {

    private List<Articles> articles;

    private RecyclerView rvNews;

    private AdapterNews adapterNews;

    private LinearLayoutManager linearLayout;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setHomeButtonEnabled(true);
        articles = new ArrayList<>();

        initNewsApi();

    }

    private void initNewsApi(){
        ApiInterface apiInterface = ApiClient.getClient().create(ApiInterface.class);

        Call<ApiResponse> call = apiInterface.getSources(Constants.NEWS_API_SOURCES_PARAM_VALUE,
                Constants.API_KEY);
        call.enqueue(new Callback<ApiResponse>() {
            @Override
            public void onResponse(Call<ApiResponse> call, Response<ApiResponse> response) {
                articles = response.body().getArticlesList();
                initView();
            }

            @Override
            public void onFailure(Call<ApiResponse> call, Throwable t) {
                initView();
            }
        });
    }

    private void initView(){
        rvNews = (RecyclerView) findViewById(R.id.rvNews);

        linearLayout = new LinearLayoutManager(this, LinearLayout.VERTICAL, false);
        adapterNews = new AdapterNews(this, articles, this);
        rvNews.setLayoutManager(linearLayout);
        rvNews.setAdapter(adapterNews);
    }

    @Override
    public void onSingleItemClick(Object object) {
        Articles articles = (Articles) object;
        Intent activityNewsDetailed = new Intent(MainActivity.this, ActivityNewsDetailed.class);
        activityNewsDetailed.putExtra(ActivityNewsDetailed.ARTICLE_OBJECT, articles);
        startActivity(activityNewsDetailed);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {

            case android.R.id.home:
                onBackPressed();
                return true;

            default:
                return false;
        }
    }
}
