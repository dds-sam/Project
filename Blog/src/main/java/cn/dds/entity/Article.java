package cn.dds.entity;

import java.io.Serializable;
import java.util.Date;

public class Article implements Serializable {
    private int article_id;
    private String article_title;//文章标题
    private String article_author;//文章作者
    private String article_time;//文章创建时间
    private int article_visits;//浏览量
    private int article_comment;//评论数
    private int article_loves;//点赞数
    private String article_content;//文章内容
    private String article_picture;//文章配图
    private String article_synopsis;//文章简介

    private Category category;
    private Catalogue catalogue;
    private Label label;

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }


    public String getArticle_title() {
        return article_title;
    }

    public void setArticle_title(String article_title) {
        this.article_title = article_title;
    }

    public String getArticle_author() {
        return article_author;
    }

    public void setArticle_author(String article_author) {
        this.article_author = article_author;
    }

    public String getArticle_time() {
        return article_time;
    }

    public void setArticle_time(String article_time) {
        this.article_time = article_time;
    }

    public int getArticle_visits() {
        return article_visits;
    }

    public void setArticle_visits(int article_visits) {
        this.article_visits = article_visits;
    }

    public int getArticle_comment() {
        return article_comment;
    }

    public void setArticle_comment(int article_comment) {
        this.article_comment = article_comment;
    }

    public int getArticle_loves() {
        return article_loves;
    }

    public void setArticle_loves(int article_loves) {
        this.article_loves = article_loves;
    }

    public String getArticle_content() {
        return article_content;
    }

    public void setArticle_content(String article_content) {
        this.article_content = article_content;
    }

    public String getArticle_picture() {
        return article_picture;
    }

    public void setArticle_picture(String article_picture) {
        this.article_picture = article_picture;
    }

    public String getArticle_synopsis() {
        return article_synopsis;
    }

    public void setArticle_synopsis(String article_synopsis) {
        this.article_synopsis = article_synopsis;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Catalogue getCatalogue() {
        return catalogue;
    }

    public void setCatalogue(Catalogue catalogue) {
        this.catalogue = catalogue;
    }

    public Label getLabel() {
        return label;
    }

    public void setLabel(Label label) {
        this.label = label;
    }

    @Override
    public String toString() {
        return "Article{" +
                "article_id=" + article_id +
                ", article_title='" + article_title + '\'' +
                ", article_author='" + article_author + '\'' +
                ", article_time='" + article_time + '\'' +
                ", article_visits=" + article_visits +
                ", article_comment=" + article_comment +
                ", article_loves=" + article_loves +
                ", article_content='" + article_content + '\'' +
                ", article_picture='" + article_picture + '\'' +
                ", article_synopsis='" + article_synopsis + '\'' +
                ", category=" + category +
                ", catalogue=" + catalogue +
                ", label=" + label +
                '}';
    }
}
