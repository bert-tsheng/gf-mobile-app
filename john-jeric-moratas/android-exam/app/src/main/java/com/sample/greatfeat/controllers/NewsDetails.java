package com.sample.greatfeat.controllers;

import android.app.ActionBar;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.TextView;

import com.sample.greatfeat.R;
import com.sample.greatfeat.controllers.network.API;
import com.squareup.picasso.Picasso;

/**
 * Created by john.moratas on 6/20/2017.
 */

public class NewsDetails extends AppCompatActivity {

    ImageView mNewsImage;
    TextView mNewsTitle;
    TextView mNewsDescription;
    private API api;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.news_detailed);
        init();
        android.support.v7.app.ActionBar actionBar = getSupportActionBar();
        actionBar.setHomeButtonEnabled(true);
        actionBar.setDisplayHomeAsUpEnabled(true);
        actionBar.setHomeAsUpIndicator(R.drawable.back);
        actionBar.setDisplayShowHomeEnabled(true);
        String image = getIntent().getExtras().getString("image");
        String title = getIntent().getExtras().getString("title");
        String description = getIntent().getExtras().getString("description");
        Picasso.with(getApplicationContext()).load(image).into(mNewsImage);
        mNewsTitle.setText(title);
        mNewsDescription.setText(description);
    }

    private void init() {
        mNewsImage = (ImageView)findViewById(R.id.news_image);
        mNewsTitle = (TextView)findViewById(R.id.news_title);
        mNewsDescription = (TextView)findViewById(R.id.news_description);
        api = new API();
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
