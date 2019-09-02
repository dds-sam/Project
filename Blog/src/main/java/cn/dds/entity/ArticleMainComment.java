package cn.dds.entity;


import java.text.SimpleDateFormat;
import java.util.Date;


public class ArticleMainComment {
    private int amaincomment_id;//主评论id
    private String amaincomment_content;//主评论内容
    private Date amaincomment_time;//评论时间
    private int article_id;//评论所属文章id
    private int hassubcomment;//是否有子评论

    private User user;//评论人信息


    public int getAmaincomment_id() {
        return amaincomment_id;
    }

    public void setAmaincomment_id(int amaincomment_id) {
        this.amaincomment_id = amaincomment_id;
    }

    public String getAmaincomment_content() {
        return amaincomment_content;
    }

    public void setAmaincomment_content(String amaincomment_content) {
        this.amaincomment_content = amaincomment_content;
    }

    public String getAmaincomment_time() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return  simpleDateFormat.format(this.amaincomment_time);
    }

    public void setAmaincomment_time(Date amaincomment_time) {
        this.amaincomment_time = amaincomment_time;
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

    public int getHassubcomment() {
        return hassubcomment;
    }

    public void setHassubcomment(int hassubcomment) {
        this.hassubcomment = hassubcomment;
    }


    @Override
    public String toString() {
        return "ArticleMainComment{" +
                "amaincomment_id=" + amaincomment_id +
                ", amaincomment_content='" + amaincomment_content + '\'' +
                ", amaincomment_time=" + amaincomment_time +
                ", article_id=" + article_id +
                ", user=" + user +
                '}';
    }
}
