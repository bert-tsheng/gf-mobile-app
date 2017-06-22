package com.example.pao.greatfeat.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Generated;

/**
 * Created by Pao on 22/06/2017.
 */

@Generated("org.jsonschema2pojo")
public class NewsListResponse {

    @SerializedName("articles")
    @Expose
    private List<NewsListData> articles = new ArrayList<NewsListData>();
    @SerializedName("status")
    @Expose
    private String status;

    public List<NewsListData> getArticles() {
        return articles;
    }

    public void setArticles(List<NewsListData> articles) { this.articles = articles; }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}

