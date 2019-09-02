package cn.dds.mapper;

import cn.dds.entity.Article;
import cn.dds.entity.Category;
import cn.dds.entity.Label;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface InitHomePageMapper {
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
