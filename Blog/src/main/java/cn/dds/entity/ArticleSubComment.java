package cn.dds.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ArticleSubComment {
    private int asubcomment_id;//子评论表id
    private String asubcomment_content;//子评论内容
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date asubcomment_time;//回复评论时间
    private String respond_name;//被回复人的名字
    private int amaincomment_id;//主评论id
    private int article_id;//子评论所属文章id
    private User user;//回复人信息

    public int getAsubcomment_id() {
        return asubcomment_id;
    }

    public void setAsubcomment_id(int asubcomment_id) {
        this.asubcomment_id = asubcomment_id;
    }

    public String getAsubcomment_content() {
        return asubcomment_content;
    }

    public void setAsubcomment_content(String asubcomment_content) {
        this.asubcomment_content = asubcomment_content;
    }

    public String getAsubcomment_time() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return  simpleDateFormat.format(this.asubcomment_time);
    }

    public void setAsubcomment_time(Date asubcomment_time) {
        this.asubcomment_time = asubcomment_time;
    }

    public String getRespond_name() {
        return respond_name;
    }

    public void setRespond_name(String respond_name) {
        this.respond_name = respond_name;
    }

    public int getAmaincomment_id() {
        return amaincomment_id;
    }

    public void setAmaincomment_id(int amaincomment_id) {
        this.amaincomment_id = amaincomment_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }
}
