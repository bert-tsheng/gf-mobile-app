package com.example.pao.greatfeat.api;

import com.google.gson.annotations.SerializedName;

/**
 * Created by Pao on 22/06/2017.
 */

public class ApiResponse {
    @SerializedName("status")
    public String status;

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    @SuppressWarnings({"unused", "used by Retrofit"})
    public ApiResponse() {
    }

    public ApiResponse(String status) {
        this.status = status;
    }
}
