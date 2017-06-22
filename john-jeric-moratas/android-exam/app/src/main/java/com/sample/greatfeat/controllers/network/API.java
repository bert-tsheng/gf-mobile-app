package com.sample.greatfeat.controllers.network;


import android.os.AsyncTask;
import android.util.Log;

import com.sample.greatfeat.adapter.News;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/**
 * Created by john.moratas on 06/20/2017.
 */

public class API {

    public static final String KEY_RETURN_CODE = "retCode";
    public static final String KEY_RETURN_MESSAGE = "retMessage";
    public static final int REQUEST_CONNECTION_TIMEOUT = 10;
    public static List<News> newsList = new ArrayList<>();
    /*
     * Client side error codes
     */
    public static final int RETURN_CODE_EXCEPTION = -2;

    public static void getNews( final ResultListener resultListener) {
        new AsyncTask<Void, Void, JSONObject>() {
            @Override
            protected JSONObject doInBackground(Void... voids) {
                try {

                    JSONObject jsonObject = getNews();
                    return jsonObject;
                } catch (Exception e) {
                    Log.e("error", "error");
                    return createResultException(e);
                }
            }

            @Override
            protected void onPostExecute(JSONObject result) {
                resultListener.onResult(result);
            }
        }.execute();
    }
    private static JSONObject getNews() throws IOException, JSONException {
        final String url = "https://newsapi.org/v1/articles?source=espn&sortBy=top&apiKey=b5153e56fc1c441584c0d8d5247df2f5" ;
        Request request = new Request.Builder()
                .url(url)
                .get()
                .build();
        OkHttpClient client = defaultHttpClient();
        Response response = client.newCall(request).execute();
        JSONObject jsonObject = new JSONObject(response.body().string());
        JSONArray jsonArray = jsonObject.getJSONArray("articles");
        News news;
        for(int i = 0; i < jsonArray.length(); i++){
            JSONObject object = jsonArray.getJSONObject(i);
            news = new News(object.getString("title"), object.getString("description"), object.getString("urlToImage"));
            newsList.add(news);
        }

        JSONObject newJsonObject = new JSONObject();
        return new JSONObject(newJsonObject.toString());
    }

    public interface ResultListener {
        /**
         * Asynchronous result
         * @param result access the return code by {@link API#KEY_RETURN_CODE } and the return message {@link API#KEY_RETURN_MESSAGE }
         * <p><b>Example:</b></p>
         * <p>int code = result.getInt(Cloud.KEY_RETURN_CODE);</p>
         * <p>String message = result.getString(Cloud.KEY_RETURN_MESSAGE);</p>
         * And compare it against the constant return codes declared in {@link API}
         */
        void onResult(JSONObject result);
    }

    private static OkHttpClient defaultHttpClient() {
        return new OkHttpClient.Builder()
                .connectTimeout(REQUEST_CONNECTION_TIMEOUT, TimeUnit.SECONDS)
                .build();
    }

    private static JSONObject createResultException(Exception e) {
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put(KEY_RETURN_CODE, RETURN_CODE_EXCEPTION);
            jsonObject.put(KEY_RETURN_MESSAGE, e.getMessage());
        }
        catch (JSONException e1) {
        }
        return jsonObject;
    }
}
