package com.greatfeat.greatfeat.startup;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.greatfeat.greatfeat.R;
import com.greatfeat.greatfeat.model.Articles;

/**
 * Created by edwardbryanabergas on 16/06/2017.
 */

public class ActivityNewsDetailed extends AppCompatActivity {

    public static String ARTICLE_OBJECT = "article";

    private TextView tvNewsTitle;
    private TextView tvNewsDescription;
    private ImageView ivNewsImage;

    private Articles articles;


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_news_detailed);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setHomeButtonEnabled(true);
        initView();
        init();

    }

    private void init() {
        if (getIntent().getSerializableExtra(ARTICLE_OBJECT) != null) {
            articles = (Articles) getIntent().getSerializableExtra(ARTICLE_OBJECT);

            Glide.with(this).load(articles.getUrlToImage()).into(ivNewsImage);
            tvNewsTitle.setText(articles.getTitle());
            tvNewsDescription.setText(articles.getDescription());
        }
    }

    private void initView() {
        tvNewsTitle = (TextView) findViewById(R.id.tvNewsTitle);
        tvNewsDescription = (TextView) findViewById(R.id.tvNewsDescription);
        ivNewsImage = (ImageView) findViewById(R.id.ivNewsImage);

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
