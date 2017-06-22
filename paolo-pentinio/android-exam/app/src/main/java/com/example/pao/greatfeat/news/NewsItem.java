package com.example.pao.greatfeat.news;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.example.pao.greatfeat.R;


import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by Pao on 22/06/2017.
 */

public class NewsItem extends AppCompatActivity{
    @BindView(R.id.news_author) TextView tvAuthor;
    @BindView(R.id.title) TextView tvTitle;
    @BindView(R.id.description) TextView tvDescription;
    @BindView(R.id.banner) ImageView ivUrl;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.news_item);
        ButterKnife.bind(this);
        ButterKnife.setDebug(true);

        tvAuthor.setText(getIntent().getStringExtra("author"));
        tvDescription.setText(getIntent().getStringExtra("description"));
        tvTitle.setText(getIntent().getStringExtra("title"));

        Glide.with(getApplicationContext())
                .load(getIntent().getStringExtra("urlToImage"))
                .diskCacheStrategy(DiskCacheStrategy.SOURCE)
                .skipMemoryCache(true)
                .into(ivUrl);
    }

}
