package cn.dds.controller;

import cn.dds.entity.*;
import cn.dds.exception.ResourcesNotExistException;
import cn.dds.service.ArticleService;
import cn.dds.service.InitHomePageService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Controller
public class ArticleController {
    @Resource(name = "initHomePageServiceImpl")
    private InitHomePageService initHomePageService;
    @Resource(name = "articleServiceImpl")
    private ArticleService articleService;
    @Resource(name = "myObjectMapper")
    private ObjectMapper objectMapper;

    //填充文章列表页面,根据一级分类查询当前分类下的文章
    @RequestMapping(value = "Article_Category/{category_id}")
    public String fillArticlePageByCategoryId(@PathVariable("category_id") int category_id, Map<String,Object> map, HttpServletRequest request) throws ResourcesNotExistException {

        //获取一级分类与二级分类
        List<Category> categories = initHomePageService.findCategory();
        map.put("categories",categories);

        //获取标签
        List<Label> labels = initHomePageService.selectLabels();
        map.put("labels",labels);

        //获取文章归档
        List<String> articleFile = initHomePageService.selectArticleFile();
        map.put("articleFile",articleFile);

        //获取热门文章
        List<Article> hotArticles = initHomePageService.hotArticle();
        map.put("hotArticles",hotArticles);

        //通过一级分类获取对应的文章
        Page<Object> Pages = PageHelper.startPage(1, 3);
        List<Article> articleByCategoryId = articleService.findArticleByCategoryId(category_id);
        map.put("articleById",articleByCategoryId);
       if(Pages.getPageNum()+1 <= Pages.getPages()){//表示有下一页
           map.put("Pages",Pages.getPageNum()+1);
           map.put("category_id",category_id);//放回一级分类id
       }
        
        //保存请求地址（为notice.jsp的登录链接提供数据）
        map.put("fromUrl",request.getRequestURI());
        
        return "forward:/views/article_list.jsp";
    }
    //为流式分页插件提供数据（第几页）根据一级分类
    @RequestMapping(value = "queryArticleByCategoryWidthPageHelper/{pageNum}/{category_id}")
    public String queryArticleByCategoryWidthPageHelper(@PathVariable("pageNum") int pageNum,@PathVariable("category_id") int category_id,Map<String,Object> map) throws ResourcesNotExistException {
        Page<Object> Pages = PageHelper.startPage(pageNum, 3);
        List<Article> articleByCategoryId = articleService.findArticleByCategoryId(category_id);
        map.put("articleById",articleByCategoryId);

        map.put("category_id",category_id);
        if(pageNum<Pages.getPages()){
            map.put("Pages",Pages.getPageNum()+1);
        }
        return "forward:/views/article_list.jsp";
    }



    //根据二级分类查询当前分类下的所有文章
    @RequestMapping(value = "Article_Catalogue/{catalogue_id}")
    public String fillArticlePageByCatalogueId(@PathVariable("catalogue_id") int catalogue_id, Map<String,Object> map,HttpServletRequest request) throws ResourcesNotExistException {
        //获取一级分类与二级分类
        List<Category> categories = initHomePageService.findCategory();
        map.put("categories",categories);

        //获取标签
        List<Label> labels = initHomePageService.selectLabels();
        map.put("labels",labels);

        //获取文章归档
        List<String> articleFile = initHomePageService.selectArticleFile();
        map.put("articleFile",articleFile);

        //获取热门文章
        List<Article> hotArticles = initHomePageService.hotArticle();
        map.put("hotArticles",hotArticles);

        //通过二级分类获取文章
        Page<Object> Pages = PageHelper.startPage(1, 3);
        List<Article> articleByCatalogueId = articleService.findArticleByCatalogueId(catalogue_id);
        map.put("articleById",articleByCatalogueId);
        if(Pages.getPageNum()+1 <= Pages.getPages()){
            map.put("catalogue_id",catalogue_id);//放回二级分类
            map.put("Pages",Pages.getPageNum()+1);
        }

        //保存请求地址（为notice.jsp的登录链接提供数据）
        map.put("fromUrl",request.getRequestURI());
        return "forward:/views/article_list.jsp";
    }
    //为流式分页插件提供数据（第几页）根据二级分类
    @RequestMapping(value = "queryArticleByCatalogueWidthPageHelper/{pageNum}/{catalogue_id}")
    public String queryArticleByCatalogueWidthPageHelper(@PathVariable("pageNum") int pageNum,@PathVariable("catalogue_id") int catalogue_id,Map<String,Object> map) throws ResourcesNotExistException {
        Page<Object> Pages = PageHelper.startPage(pageNum, 3);
        List<Article> articleByCatalogueId = articleService.findArticleByCatalogueId(catalogue_id);
        map.put("articleById",articleByCatalogueId);

        map.put("catalogue_id",catalogue_id);
        if(pageNum<Pages.getPages()){
            map.put("Pages",Pages.getPageNum()+1);
        }
        return "forward:/views/article_list.jsp";
    }

    //根据标签id查询文章
    @RequestMapping(value = "Article_Label/{label_id}")
    public String queryArticleByLabelId(@PathVariable("label_id") int label_id,Map<String,Object> map,HttpServletRequest request){
        //获取一级分类与二级分类
        List<Category> categories = initHomePageService.findCategory();
        map.put("categories",categories);

        //获取标签
        List<Label> labels = initHomePageService.selectLabels();
        map.put("labels",labels);

        //获取文章归档
        List<String> articleFile = initHomePageService.selectArticleFile();
        map.put("articleFile",articleFile);

        //获取热门文章
        List<Article> hotArticles = initHomePageService.hotArticle();
        map.put("hotArticles",hotArticles);

        //分页查询文章
        Page<Object> Pages = PageHelper.startPage(1, 3);
        List<Article> articleByLabelId = articleService.queryArticleByLabelId(label_id);
        map.put("articleById",articleByLabelId);
        if(Pages.getPageNum()+1 <= Pages.getPages()){//表示有下一页
            map.put("label_id",label_id);//放回标签
            map.put("Pages",Pages.getPageNum()+1);
        }

        //保存请求地址（为notice.jsp的登录链接提供数据）
        map.put("fromUrl",request.getRequestURI());

        return "forward:/views/article_list.jsp";
    }
    //为流式分页插件提供数据（第几页）根据标签
    @RequestMapping(value = "queryArticleByLabelWidthPageHelper/{pageNum}/{label_id}")
    public String queryArticleByLabelWidthPageHelper(@PathVariable("pageNum") int pageNum,@PathVariable("label_id") int label_id,Map<String,Object> map){
        Page<Object> Pages = PageHelper.startPage(pageNum, 3);
        List<Article> articleByLabelId = articleService.queryArticleByLabelId(label_id);
        map.put("articleById",articleByLabelId);

        map.put("label_id",label_id);
        if(pageNum<Pages.getPages()){
            map.put("Pages",Pages.getPageNum()+1);
        }

        return "forward:/views/article_list.jsp";
    }

     //根据文章归档查询相应文章
    @RequestMapping(value = "queryArticleByTime/{time}")
    public String queryArticleByTime(@PathVariable("time") String time,Map<String,Object> map,HttpServletRequest request){
        //获取一级分类与二级分类
        List<Category> categories = initHomePageService.findCategory();
        map.put("categories",categories);

        //获取标签
        List<Label> labels = initHomePageService.selectLabels();
        map.put("labels",labels);

        //获取文章归档
        List<String> articleFile = initHomePageService.selectArticleFile();
        map.put("articleFile",articleFile);

        //获取热门文章
        List<Article> hotArticles = initHomePageService.hotArticle();
        map.put("hotArticles",hotArticles);

        //根据文章归档查询相应文章
        Page<Object> Pages = PageHelper.startPage(1, 3);
        List<Article> articleByTime = articleService.queryArticleByTime(time);
        map.put("articleById",articleByTime);
        if(Pages.getPageNum()+1 <= Pages.getPages()){//表示有下一页
            map.put("time",time);//放回标签
            map.put("Pages",Pages.getPageNum()+1);
        }
        //保存请求地址（为notice.jsp的登录链接提供数据）
        map.put("fromUrl",request.getRequestURI());

        return "forward:/views/article_list.jsp";
    }
    //为流式分页插件提供数据（第几页）根据归档时间
    @RequestMapping(value = "queryArticleByTimeWidthPageHelper/{pageNum}/{time}")
    public String queryArticleByTimeWidthPageHelper(@PathVariable("pageNum") int pageNum,@PathVariable("time") String time,Map<String,Object> map){
        Page<Object> Pages = PageHelper.startPage(pageNum,3);
        List<Article> articleByTime = articleService.queryArticleByTime(time);
        map.put("articleById",articleByTime);

        map.put("time",time);
        if(pageNum<Pages.getPages()){
            map.put("Pages",Pages.getPageNum()+1);
        }

        return "forward:/views/article_list.jsp";
    }



    //显示文章内容
    @RequestMapping(value = "ArticleDetails/{article_id}")
    public String fillArticlePageMessage(@PathVariable("article_id") int article_id, Model model,HttpServletRequest request) throws ResourcesNotExistException {
        //获取一级分类与二级分类
        List<Category> categories = initHomePageService.findCategory();
        model.addAttribute("categories",categories);
        //获取文章详情
        Article articleDetailsById = articleService.findArticleDetailsById(article_id);
        model.addAttribute("articleDetails",articleDetailsById);

        //获取文章归档
        List<String> articleFile = initHomePageService.selectArticleFile();
        model.addAttribute("articleFile",articleFile);

        //获取标签
        List<Label> labels = initHomePageService.selectLabels();
        model.addAttribute("labels",labels);

        //获取热门文章
        List<Article> hotArticles = initHomePageService.hotArticle();
        model.addAttribute("hotArticles",hotArticles);

        //获取文章评论
        List<ArticleMainComment> articleMainCommentByIds =articleService.findArticleMainCommentById(article_id);
        model.addAttribute("articleMainComments",articleMainCommentByIds);

        //获取吐槽数
        int debunks = articleService.findDebunks(article_id);
        model.addAttribute("debunks",debunks);

        //保存请求地址（为notice.jsp的登录链接提供数据）
        model.addAttribute("fromUrl",request.getRequestURI());

        return "forward:/views/article.jsp";
    }
    //为文章页面前端提供回复评论数据
    @ResponseBody
    @RequestMapping(value = "findSubComments")
    public String findSubCommentById(HttpServletRequest request) throws JsonProcessingException {
        String aMainComment_id = request.getParameter("aMainComment_id");
        List<ArticleSubComment> articleSubCommentById = articleService.findArticleSubCommentById(Integer.parseInt(aMainComment_id));
        String  articleSubCommentJson = objectMapper.writeValueAsString(articleSubCommentById);
        return articleSubCommentJson;
    }
    //处理点赞
    @ResponseBody
    @RequestMapping(value = "addArticleLoves")
    public String addArticleLoves(HttpServletRequest request) throws JsonProcessingException, ResourcesNotExistException {
        String article_id = request.getParameter("um_id");//获取点赞文章的id
        Article articleDetailsById = articleService.findArticleDetailsById(Integer.parseInt(article_id));
        articleService.updateArticleLoves(Integer.parseInt(article_id));

        return objectMapper.writeValueAsString(articleDetailsById.getArticle_loves()+1);
    }

}
