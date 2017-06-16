package com.greatfeat.greatfeat.model;

import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by edwardbryanabergas on 15/06/2017.
 */

public class ApiResponse {

    @SerializedName("status")
    private String status;

    @SerializedName("source")
    private String source;

    @SerializedName("sortBy")
    private String sortBy;

    @SerializedName("articles")
    private List<Articles> articlesList = new ArrayList<>();

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getSortBy() {
        return sortBy;
    }

    public void setSortBy(String sortBy) {
        this.sortBy = sortBy;
    }

    public List<Articles> getArticlesList() {
        return articlesList;
    }

    public void setArticlesList(List<Articles> articlesList) {
        this.articlesList = articlesList;
    }
}
