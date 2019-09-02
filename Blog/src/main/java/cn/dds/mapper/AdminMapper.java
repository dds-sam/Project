package cn.dds.mapper;

import cn.dds.entity.Article;
import cn.dds.entity.Catalogue;
import cn.dds.entity.Category;
import cn.dds.entity.Label;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AdminMapper {
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
