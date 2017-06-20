package com.sample.greatfeat.static_ui;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;

import com.sample.greatfeat.R;
import com.sample.greatfeat.controllers.MainActivity;
import com.sample.greatfeat.controllers.network.API;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.concurrent.TimeUnit;

/**
 * Created by john.moratas on 6/19/2017.
 */

public class SplashScreen extends AppCompatActivity {

    private final int SPLASH_DISPLAY_LENGTH = (int) TimeUnit.SECONDS.toMillis(2);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.splash_screen);
        API.getNews(new API.ResultListener() {
            @Override
            public void onResult(JSONObject result) {
            }
        });
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                Intent intent = new Intent(SplashScreen.this, MainActivity.class);
                startActivity(intent);
                finish();
            }
        }, SPLASH_DISPLAY_LENGTH);
    }
}
