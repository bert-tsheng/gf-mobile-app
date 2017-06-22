package com.example.pao.greatfeat.news;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.View;
import android.widget.ProgressBar;

import com.example.pao.greatfeat.MainActivity;
import com.example.pao.greatfeat.api.Service;
import com.example.pao.greatfeat.models.NewsListData;
import com.example.pao.greatfeat.models.NewsListResponse;
import com.example.pao.greatfeat.R;

import javax.inject.Inject;

/**
 * Created by Pao on 22/06/2017.
 */

public class NewsActivity extends MainActivity implements NewsView{
    private RecyclerView list;
    @Inject
    public Service service;
    ProgressBar progressBar;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getDeps().inject(this);

        Log.d("GG CREATE THIS", "ALPHA");
        renderView();
        init();

        NewsPresenter presenter = new NewsPresenter(service, this);
        presenter.getCityList();
    }

    public  void renderView(){
        setContentView(R.layout.activity_main);
        list = (RecyclerView) findViewById(R.id.list);
        progressBar = (ProgressBar) findViewById(R.id.progress);
    }

    public void init(){
        list.setLayoutManager(new LinearLayoutManager(this));
    }

    @Override
    public void showWait() {
        progressBar.setVisibility(View.VISIBLE);
    }

    @Override
    public void removeWait() {
        progressBar.setVisibility(View.GONE);
    }

    @Override
    public void onFailure(String appErrorMessage) {
        Log.d("GG ERROR HOMEACTIVITY", appErrorMessage);

    }

    @Override
    public void getityListSuccess(NewsListResponse cityListResponse) {

        NewsAdapter adapter = new NewsAdapter(getApplicationContext(), cityListResponse.getArticles(),
                new NewsAdapter.OnItemClickListener() {
                    @Override
                    public void onClick(NewsListData Item) {
                        Intent intent = new Intent(NewsActivity.this,NewsItem.class);
                        intent.putExtra("author",Item.getAuthor());
                        intent.putExtra("title", Item.getTitle());
                        intent.putExtra("description", Item.getDescription());
                        intent.putExtra("urlToImage", Item.getUrlToImage());
                        startActivity(intent);

                    }
                });

        list.setAdapter(adapter);

    }
}
