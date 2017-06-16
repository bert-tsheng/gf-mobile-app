package com.greatfeat.greatfeat.startup;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.greatfeat.greatfeat.R;
import com.greatfeat.greatfeat.api.OnBindViewListener;
import com.greatfeat.greatfeat.api.OnSingleItemClickListener;
import com.greatfeat.greatfeat.model.Articles;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by edwardbryanabergas on 16/06/2017.
 */

public class AdapterNews extends RecyclerView.Adapter<AdapterNews.ViewHolder> {

    private Context context;
    private List<Articles> articlesList;

    private OnSingleItemClickListener onSingleItemClickListener;

    public AdapterNews(Context context, List<Articles> articlesList, OnSingleItemClickListener onSingleItemClickListener) {
        this.context = context;
        this.articlesList = new ArrayList<>();
        this.articlesList = articlesList;
        this.onSingleItemClickListener = onSingleItemClickListener;

    }


    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(context).inflate(R.layout.item_news, parent, false);
        ViewHolder viewHolder = new ViewHolder(v);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        ((OnBindViewListener) holder).onBind(position);
    }

    @Override
    public int getItemCount() {
        return articlesList.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder implements OnBindViewListener {

        private TextView tvTitle;
        private TextView tvDescription;

        private View itemView;

        public ViewHolder(View itemView) {
            super(itemView);
            this.itemView = itemView;
            tvTitle = (TextView) itemView.findViewById(R.id.tvTitle);
            tvDescription = (TextView) itemView.findViewById(R.id.tvDescription);
        }

        @Override
        public void onBind(int position) {
            final Articles articles = articlesList.get(position);

            if (articles != null) {
                if (articles.getTitle() != null) {
                    tvTitle.setText(articles.getTitle());
                }

                if (articles.getDescription() != null) {
                    tvDescription.setText(articles.getDescription());
                }

                itemView.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        onSingleItemClickListener.onSingleItemClick(articles);
                    }
                });
            }

        }
    }
}
