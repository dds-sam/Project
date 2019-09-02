package cn.dds.service;

import cn.dds.entity.Article;
import cn.dds.entity.ArticleMainComment;
import cn.dds.entity.ArticleSubComment;
import cn.dds.exception.ResourcesNotExistException;
import cn.dds.mapper.ArticleMapper;
import cn.dds.utils.RedisUtils;
import javafx.scene.effect.SepiaTone;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Resource(name = "articleMapper")
    private ArticleMapper articleMapper;



    @Override
    public List<Article> findArticleByCategoryId(int category_id) throws ResourcesNotExistException {
        List<Article> articleByCategoryId = articleMapper.findArticleByCategoryId(category_id);
        if(articleByCategoryId.size() == 0){
            throw new ResourcesNotExistException("您访问的资源不存在！！！");
        }
        return articleByCategoryId;
    }

    @Override
    public List<Article> findArticleByCatalogueId(int catalogue_id) throws ResourcesNotExistException {
        List<Article> articleByCatalogueId = articleMapper.findArticleByCatalogueId(catalogue_id);
        if(articleByCatalogueId.size() ==0){
            throw new ResourcesNotExistException("您访问的资源不存在！！！");
        }
        return articleByCatalogueId;
    }

    @Override
    public Article findArticleDetailsById(int article_id) throws ResourcesNotExistException {
        Article articleDetailsById = articleMapper.findArticleDetailsById(article_id);
        if(articleDetailsById == null){
            throw new ResourcesNotExistException("您访问的文章不存在！！！");
        }
        return articleDetailsById;
    }

    @Override
    public List<ArticleMainComment> findArticleMainCommentById(int article_id) {
        List<ArticleMainComment> articleMainCommentByIds = articleMapper.findArticleMainCommentById(article_id);
        return articleMainCommentByIds;
    }

    @Override
    public List<ArticleSubComment> findArticleSubCommentById(int asubcomment_id) {
        return articleMapper.findArticleSubCommentById(asubcomment_id);
    }

    @Override
    public void updateArticleLoves(int article_id) {
        articleMapper.updateArticleLoves(article_id);
    }

    @Override
    public List<Article> queryArticleByLabelId(int label_id) {
        return articleMapper.queryArticleByLabelId(label_id);
    }
    /**
     * 通过文章归档时间查询文章
     * @param time
     * @return
     */
    @Override
    public List<Article> queryArticleByTime(String time) {
        return articleMapper.queryArticleByTime(time);
    }

    @Override
    public void updateArticleCommentNum(int article_id) {
        articleMapper.updateArticleCommentNum(article_id);
    }
    /**
     * 搜集一篇文章的吐槽人数
     * @param article_id
     * @return
     */
    @Override
    public int findDebunks(int article_id) {
        List<String> debunksFromMainComment = articleMapper.findDebunksFromMainComment(article_id);
        List<String> debunksFromSubComment = articleMapper.findDebunksFromSubComment(article_id);

        debunksFromMainComment.addAll(debunksFromSubComment);
        List<String> stringList = this.duplicateRemovalList(debunksFromMainComment);//去重
        return stringList.size();
    }

    //集合去重
    private List<String> duplicateRemovalList(List<String> list){
        Set<String> set = new HashSet<>();

        for(String id:list){
              set.add(id);
        }
        List<String> stringList = new ArrayList<>(set);
        return stringList;
    }
}
