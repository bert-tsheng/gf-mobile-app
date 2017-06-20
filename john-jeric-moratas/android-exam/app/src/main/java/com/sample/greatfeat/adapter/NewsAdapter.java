package com.sample.greatfeat.adapter;

/**
 * Created by john.moratas on 6/20/2017.
 */

import android.content.Context;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.sample.greatfeat.R;
import com.sample.greatfeat.controllers.ItemClickListener;
import com.sample.greatfeat.controllers.MainActivity;
import com.sample.greatfeat.controllers.NewsDetails;

import java.util.ArrayList;
import java.util.List;

class RecyclerViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {


    public TextView title;
    public TextView description;
    private ItemClickListener itemClickListener;

    public RecyclerViewHolder(View itemView) {
        super(itemView);
        itemView.setOnClickListener(this);
        title = (TextView) itemView.findViewById(R.id.title);
        description = (TextView) itemView.findViewById(R.id.description);
//            description = (TextView) view.findViewById(R.id.description);
    }

    public void setItemClickListener(ItemClickListener itemClickListener) {
        this.itemClickListener = itemClickListener;
    }

    @Override
    public void onClick(View view) {
        itemClickListener.onClick(view, getAdapterPosition());
    }

}

public class NewsAdapter extends RecyclerView.Adapter<RecyclerViewHolder>{
    private List<News> newsList = new ArrayList<>();
    private Context mContext;

    public NewsAdapter(List<News> newsList, Context mContext){
        this.newsList = newsList;
        this.mContext = mContext;
    }
    @Override
    public RecyclerViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View itemView =  inflater.inflate(R.layout.news_list_row, parent, false);
        return new RecyclerViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(RecyclerViewHolder holder, int position) {
        final News news = newsList.get(position);
        holder.title.setText(news.getTitle());
        holder.description.setText(news.getDescription());
        holder.setItemClickListener(new ItemClickListener() {
            @Override
            public void onClick(View view, int position) {
                Intent activityNewsDetailed = new Intent(mContext, NewsDetails.class).setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                activityNewsDetailed.putExtra("image", news.getImage());
                activityNewsDetailed.putExtra("title", news.getTitle());
                activityNewsDetailed.putExtra("description", news.getDescription());
                mContext.startActivity(activityNewsDetailed);
            }
        });
    }

    @Override
    public int getItemCount() {
        return newsList.size();
    }
}

//    public class MyViewHolder extends RecyclerView.ViewHolder {
//        public TextView title, description;
//
//        public MyViewHolder(View view) {
//            super(view);
//            title = (TextView) view.findViewById(R.id.title);
//            description = (TextView) view.findViewById(R.id.description);
//        }
//    }
//
//
//    public NewsAdapter(List<News> moviesList) {
//        this.newsList = moviesList;
//    }
//
//    @Override
//    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
//        View itemView = LayoutInflater.from(parent.getContext())
//                .inflate(R.layout.news_list_row, parent, false);
//
//        return new MyViewHolder(itemView);
//    }
//
//    @Override
//    public void onBindViewHolder(MyViewHolder holder, int position) {
//        News news = newsList.get(position);
//        holder.title.setText(news.getTitle());
//        holder.description.setText(news.getDescription());
//    }
//
//    @Override
//    public int getItemCount() {
//        return newsList.size();
//    }
