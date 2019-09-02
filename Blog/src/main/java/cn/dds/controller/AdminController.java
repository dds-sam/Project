package cn.dds.controller;

import cn.dds.entity.Article;
import cn.dds.entity.Catalogue;
import cn.dds.entity.Category;
import cn.dds.entity.Label;
import cn.dds.service.AdminService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class AdminController {
    @Resource(name = "myObjectMapper")
    private ObjectMapper objectMapper;
    @Resource(name = "adminServiceImpl")
    private AdminService adminService;

    //增加新文章
    @RequestMapping(value = "/adminAddArticle")
    public String adminAddArticle(Article article, @RequestParam("file") MultipartFile file, HttpServletRequest request){
        try {
            //封装相应数据
            article.setArticle_content(request.getParameter("test-editormd-html-code"));//文章内容
            article.setArticle_author("dds");//文章作者

            //获取上传文件名
            String originalFilename = file.getOriginalFilename();
            //处理文件名
            String replace = UUID.randomUUID().toString().replace("-", "");
            String fileName =replace + originalFilename;

            //获取上传文件的存储地址
            String path_store = request.getServletContext().getRealPath("/upload/articleImage");
            //如果文件夹不存在则创建
            File file1 = new File(path_store);
            if (!file1.exists()){
                file1.mkdirs();
            }
            //获取文件输入流
            InputStream input = file.getInputStream();
            OutputStream out = new FileOutputStream(path_store+"/"+fileName);
            byte[] bs = new byte[1024];
            int len = -1;
            while(( len = input.read(bs)) !=-1 ) {
                out.write(bs, 0, len);
            }
            out.close();
            input.close();

            //设置文章配图路径
            article.setArticle_picture("upload/articleImage/"+fileName);
            adminService.insertArticle(article);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:admin/article.jsp";
    }

    //当点击增加文章时为页面提供数据(一级标题，标签)
    @RequestMapping(value = "/provideData")
    public String provideData(Map<String,Object> map){
        List<Category> categories = adminService.selectCategory();
        map.put("categories",categories);

        List<Label> labels = adminService.selectLabel();
        map.put("labels",labels);

        return "forward:/admin/add-article.jsp";
    }
    //为ajax请求返回二级目录
    @ResponseBody
    @RequestMapping(value = "/provideCatalogue")
    public String provideCatalogue(@RequestParam("category_id") int category_id){
        List<Catalogue> catalogues = adminService.selectCatalogueByCategoryId(category_id);
        String catalogueJson = null;
        try {
            catalogueJson = objectMapper.writeValueAsString(catalogues);

        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return catalogueJson;
    }

    //接收文章内容中的图片
    @ResponseBody
    @RequestMapping(value = "/uploadArticlePictures")
    public String uploadArticlePictures(@RequestParam(value = "editormd-image-file") MultipartFile file, Map<String,Object> map, HttpServletRequest request){
        String stateMap = null;
        try {
//            System.out.println("??????");
            String originalFilename = file.getOriginalFilename();
//            System.out.println("originalFilename"+originalFilename);
            //处理文件名
            String replace = UUID.randomUUID().toString().replace("-", "");
            String fileName =replace + originalFilename;

            //获取上传文章图片的存储地址
            String path_store = request.getServletContext().getRealPath("/upload/articlePictures");
            File pictures_store = new File(path_store);
            if(!pictures_store.exists()){
                pictures_store.mkdirs();
            }
            //获取文件输入流
            InputStream input = file.getInputStream();
            OutputStream out = new FileOutputStream(path_store+"/"+fileName);
            byte[] bs = new byte[1024];
            int len = -1;
            while(( len = input.read(bs)) !=-1 ) {
                out.write(bs, 0, len);
            }
            out.close();
            input.close();
           //文件上传完毕
           //获取绝对路径
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://"
                    + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";

            map.put("success",1);
            map.put("message","上传成功");
            map.put("url",basePath+"upload/articlePictures/"+fileName);//文件采用绝对路径

            stateMap = objectMapper.writeValueAsString(map);

        } catch (IOException e) {
            map.put("success",0);
            map.put("message","上传失败");
            e.printStackTrace();
        }
        return stateMap;
    }


}
