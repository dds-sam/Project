package cn.dds.service;

import cn.dds.entity.Article;
import cn.dds.entity.Category;
import cn.dds.entity.Label;

import java.util.List;

public interface InitHomePageService {
    /**
     * 获取分类
     * @return
     */
    List<Category> findCategory();
    /**
     * 获取文章
     * @return
     */
    List<Article> findArticle();
    /**
     * 获取热门文章
     * @return
     */
    List<Article> hotArticle();

    /**
     * 获取标签列表
     * @return
     */
    List<Label> selectLabels();

    /**
     * 查询文章归档
     * @return
     */
    List<String> selectArticleFile();
}
