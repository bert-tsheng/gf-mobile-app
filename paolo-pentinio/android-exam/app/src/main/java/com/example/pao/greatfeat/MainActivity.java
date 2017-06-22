package com.example.pao.greatfeat;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

import com.example.pao.greatfeat.api.ApiModule;
import com.example.pao.greatfeat.deps.DaggerDeps;
import com.example.pao.greatfeat.deps.Deps;

import java.io.File;


public class MainActivity extends AppCompatActivity{
    Deps deps;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.d("GG","ALPHA");
        File cacheFile = new File(getCacheDir(), "news");
        deps = DaggerDeps.builder().apiModule(new ApiModule(cacheFile)).build();

    }

    public Deps getDeps() {
        return deps;
    }
}


