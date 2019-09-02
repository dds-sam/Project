package cn.dds.service;

import cn.dds.entity.Article;
import cn.dds.entity.Catalogue;
import cn.dds.entity.Category;
import cn.dds.entity.Label;

import java.util.List;

public interface AdminService {
    /**
     * 查询一级分类
     * @return
     */
    List<Category> selectCategory();

    /**
     * 查询标签
     * @return
     */
    List<Label> selectLabel();

    /**
     * 根据一级分类id查询二级分类
     * @param category_id
     * @return
     */
    List<Catalogue> selectCatalogueByCategoryId(int category_id);

    /**
     * 添加文章
     * @param article
     */
    void insertArticle(Article article);
}
