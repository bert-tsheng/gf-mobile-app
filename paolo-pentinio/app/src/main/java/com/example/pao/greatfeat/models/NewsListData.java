package com.example.pao.greatfeat.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import javax.annotation.Generated;

/**
 * Created by Pao on 22/06/2017.
 */

@Generated("org.jsonschema2pojo")
public class NewsListData {

    @SerializedName("author")
    @Expose
    private String author;
    @SerializedName("title")
    @Expose
    private String title;
    @SerializedName("description")
    @Expose
    private String description;
    @SerializedName("urlToImage")
    @Expose
    private String urlToImage;


    public String getAuthor() { return author; }

    public void setAuthor(String author) { this.author = author; }

    public String getTitle() { return title; }

    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }

    public void setDescription(String description) { this.description = description; }

    public String getUrlToImage() { return urlToImage; }

    public void setUrlToImage(String urlToImage) { this.urlToImage = urlToImage; }

}
