package cn.dds.controller;


import cn.dds.entity.Article;
import cn.dds.entity.ArticleMainComment;
import cn.dds.entity.Category;
import cn.dds.entity.Label;
import cn.dds.service.ArticleService;
import cn.dds.service.InitHomePageService;
import cn.dds.utils.RedisUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;


@Controller
public class InitHomePageController {
    @Resource(name = "initHomePageServiceImpl")
    private InitHomePageService initHomePageService;
    @Resource(name = "articleServiceImpl")
    private ArticleService articleService;
//    @Resource
//    private RedisTemplate redisTemplate;
//    @Resource
//    private ObjectMapper objectMapper;
//    @Resource(name = "redisUtilsImpl")
//    private RedisUtils redisUtils;


   @RequestMapping(value = "/InitHomePage")
   @SuppressWarnings("unchecked")
    public String InitHomePage(Map<String,Object> map, HttpServletRequest request) {
       //获取分类
       List<Category>  categories = initHomePageService.findCategory() ;
       map.put("categories",categories);

       //获取热门文章
       List<Article> hotArticles = initHomePageService.hotArticle();
       map.put("hotArticles",hotArticles);

       //获取标签
       List<Label> labels = initHomePageService.selectLabels();
       map.put("labels",labels);

       //获取文章归档
       List<String> articleFile = initHomePageService.selectArticleFile();
       map.put("articleFile",articleFile);

       //获取主页面需要显示的文章(分页展示)
       Page<Object> Pages = PageHelper.startPage(1, 3);
       List<Article> homePageArticles = initHomePageService.findArticle();
       //将数据放入request域中
       map.put("homePageArticles",homePageArticles);
       map.put("Pages",Pages.getPageNum()+1);



       //保存请求地址（为notice.jsp的登录链接提供数据）
       map.put("fromUrl",request.getRequestURI());

       return "forward:/views/index.jsp";
   }
   @RequestMapping(value = "/queryArticleWidthPageHelper/{pageNum}")
    public String queryArticleWidthPageHelper(@PathVariable("pageNum") int pageNum,Map<String,Object> map){

       Page<Object> Pages = PageHelper.startPage(pageNum, 3);
       List<Article> homePageArticles = initHomePageService.findArticle();

       //将数据放入request域中
       map.put("homePageArticles",homePageArticles);
       if(pageNum<Pages.getPages()){
           map.put("Pages",Pages.getPageNum()+1);
       }

       return "forward:/views/index.jsp";
    }
    @RequestMapping(value = "/aboutMe")
    public String aboutMe(Map<String,Object> map,HttpServletRequest request){
        //获取分类
        List<Category>  categories = initHomePageService.findCategory() ;
        map.put("categories",categories);
        //保存请求地址（为notice.jsp的登录链接提供数据）
        map.put("fromUrl",request.getRequestURI());

       return "forward:/views/about.jsp";
    }
    @RequestMapping(value = "messageForMe")
    public String messageForMe(Map<String,Object> map,HttpServletRequest request){
        //获取分类
        List<Category>  categories = initHomePageService.findCategory() ;
        map.put("categories",categories);
        //保存请求地址（为notice.jsp的登录链接提供数据）
        map.put("fromUrl",request.getRequestURI());
        //获取文章评论
        List<ArticleMainComment> articleMainCommentByIds =articleService.findArticleMainCommentById(1024);
        map.put("articleMainComments",articleMainCommentByIds);
        //获取吐槽数
        int debunks = articleService.findDebunks(1024);
        map.put("debunks",debunks);

        map.put("messageForMeId",1024);//设定message.jsp页面id是1024
       return "forward:/views/message.jsp";
    }

}
