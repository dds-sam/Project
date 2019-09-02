package cn.dds.service;

import cn.dds.entity.Article;
import cn.dds.entity.Category;
import cn.dds.entity.Label;
import cn.dds.mapper.InitHomePageMapper;
import cn.dds.utils.RedisUtils;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
@Service
public class InitHomePageServiceImpl implements InitHomePageService {
    @Resource
    private InitHomePageMapper initHomePageMapper;
    @Resource(name = "redisUtilsImpl")
    private RedisUtils redisUtils;
    @Resource(name = "myObjectMapper")
    private ObjectMapper objectMapper;


    @Override
    public List<Category> findCategory() {
        List<Category> categories=null;
        try {
            //先从redis库中取出categories
            String  categoryJson = redisUtils.getValue("categories");
            //如果取出不为空（有数据）
            if(categoryJson !=null && categoryJson.length()!=0){
                //将json转为集合类型
                JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, Category.class);
                categories = objectMapper.readValue(categoryJson, javaType);

            }else {
                //向mysql数据库中查找数据
                categories = initHomePageMapper.findCategory();
                //将集合转为json
                String category = objectMapper.writeValueAsString(categories);
                //将转为json的字符串存入redis并设置缓存时间（30分钟）
                redisUtils.insert("categories",category,30);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return categories;
    }

    @Override
    public List<Article> findArticle() {

        List<Article> homePageArticles = initHomePageMapper.findArticle();
//        try {
//            String homePageArticlesJson = redisUtils.getValue("homePageArticles");
//            if(homePageArticlesJson !=null && homePageArticlesJson.length()!=0){
//                JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, Article.class);
//                homePageArticles = objectMapper.readValue(homePageArticlesJson, javaType);
//            }else {
//                //向mysql数据库中查找数据
//                homePageArticles = initHomePageMapper.findArticle();
//                //将集合转为json
//                String homePageArticle = objectMapper.writeValueAsString(homePageArticles);
//                //将转为json的字符串存入redis并设置缓存时间（30分钟）
//                redisUtils.insert("homePageArticles",homePageArticle,30);
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        return homePageArticles;
    }

    @Override
    public List<Article> hotArticle() {
        List<Article> hotArticles =null;
        try {
            String  hotArticlesJson = redisUtils.getValue("hotArticles");
            if(hotArticlesJson !=null && hotArticlesJson.length()!=0){
                JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, Article.class);
                hotArticles = objectMapper.readValue(hotArticlesJson, javaType);

            }else {
                hotArticles = initHomePageMapper.hotArticle();
                String  hotArticle = objectMapper.writeValueAsString(hotArticles);
                redisUtils.insert("hotArticles",hotArticle,30);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return hotArticles;
    }

    @Override
    public List<Label> selectLabels() {
        List<Label> articleLabels = null;
        try {
            String articleLabelJson = redisUtils.getValue("articleLabels");
            if(articleLabelJson !=null && articleLabelJson.length()!=0){
                JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, Label.class);
                articleLabels = objectMapper.readValue(articleLabelJson,javaType);
            } else {
                articleLabels = initHomePageMapper.selectLabels();
                String articleLabel = objectMapper.writeValueAsString(articleLabels);
                redisUtils.insert("articleLabels",articleLabel,30);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return  articleLabels;
    }
    /**
     * 查询文章归档
     * @return
     */
    @Override
    public List<String> selectArticleFile() {
        List<String> articleFiles =null;
        try {
            String articleFileJson = redisUtils.getValue("articleFiles");
            if(articleFileJson != null && articleFileJson.length() != 0){
                JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, String.class);
                articleFiles = objectMapper.readValue(articleFileJson,javaType);
            }else {
                articleFiles = initHomePageMapper.selectArticleFile();
                String articleFile = objectMapper.writeValueAsString(articleFiles);
                redisUtils.insert("articleFiles",articleFile,30);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return articleFiles;
    }

}
