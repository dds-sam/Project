package cn.dds.service;

import cn.dds.entity.Article;
import cn.dds.entity.Catalogue;
import cn.dds.entity.Category;
import cn.dds.entity.Label;
import cn.dds.mapper.AdminMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Service
public class AdminServiceImpl implements AdminService {
    @Resource(name = "adminMapper")
    private AdminMapper adminMapper;


    /**
     * 查询一级分类
     * @return
     */
    @Override
    public List<Category> selectCategory() {
        List<Category> categories = adminMapper.selectCategory();
        return categories;
    }
    /**
     * 查询标签
     * @return
     */
    @Override
    public List<Label> selectLabel() {
        List<Label> labels = adminMapper.selectLabel();
        return labels;
    }

    @Override
    public List<Catalogue> selectCatalogueByCategoryId(int category_id) {
        List<Catalogue> catalogues = adminMapper.selectCatalogueByCategoryId(category_id);
        return catalogues;
    }

    @Override
    public void insertArticle(Article article) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        article.setArticle_time(dateFormat.format(new Date()));//创作文章的时间
        article.setArticle_visits(0);//设置浏览量为0
        article.setArticle_comment(0);//评论数0
        article.setArticle_loves(0);//点赞数0
        adminMapper.insertArticle(article);
    }
}
