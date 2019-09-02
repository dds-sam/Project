package cn.dds.mapper;

import cn.dds.entity.Article;
import cn.dds.entity.ArticleMainComment;
import cn.dds.entity.ArticleSubComment;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ArticleMapper {
    /**
     * 通过一级分类查找相应的文章
     * @param category_id
     * @return  List<Article>
     */
    List<Article> findArticleByCategoryId(int category_id);
    /**
     * 通过二级分类查找相应的文章
     * @param catalogue_id
     * @return List<Article>
     */
    List<Article> findArticleByCatalogueId(int catalogue_id);
    /**
     * 通过文章id查询文章的信息
     * @param article_id
     * @return Article
     */
    Article findArticleDetailsById(int article_id);
    /**
     * 通过文章id查询文章的信息
     * @param article_id
     * @return ArticleMainComment
     */
    List<ArticleMainComment> findArticleMainCommentById(int article_id);
    /**
     * 通过主评论id查询子评论
     * @param asubcomment_id
     * @return
     */
    List<ArticleSubComment> findArticleSubCommentById(int asubcomment_id);

    /**
     * 通过文章id修改点赞数
     * @param article_id
     */
    void updateArticleLoves(int article_id);
    /**
     * 通过标签id查询文章
     * @param label_id
     * @return
     */
    List<Article> queryArticleByLabelId(int label_id);
    /**
     * 通过文章归档时间查询文章
     * @param time
     * @return
     */
    List<Article> queryArticleByTime(String time);

    /**
     * 修改文章的评论数
     * @param article_id
     */
    void updateArticleCommentNum(int article_id);
    /**
     * 搜集一篇文章的吐槽人数（主评论）
     * @param article_id
     * @return
     */
    List<String> findDebunksFromMainComment(int article_id);
    /**
     * 搜集一篇文章的吐槽人数（子评论）
     * @param article_id
     * @return
     */
    List<String> findDebunksFromSubComment(int article_id);
}
