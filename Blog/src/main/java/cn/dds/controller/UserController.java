package cn.dds.controller;

import cn.dds.entity.ArticleMainComment;
import cn.dds.entity.ArticleSubComment;
import cn.dds.entity.SmiliesMap;
import cn.dds.entity.User;
import cn.dds.service.ArticleService;
import cn.dds.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.util.Date;
import java.util.Map;
import java.util.UUID;


@Controller
public class UserController {
    @Resource(name = "userServiceImpl")
    private UserService userService;
    @Resource(name = "articleServiceImpl")
    private ArticleService articleService;
    @Resource(name = "myObjectMapper")
    private ObjectMapper objectMapper;
    @Resource
    private SmiliesMap smiliesMap;
    @Resource
    private ArticleMainComment articleMainComment;
    @Resource
    private ArticleSubComment articleSubComment;

    //用户登录
    @RequestMapping(value = "userLogin")
    public String userLogin(User user, Map<String,Object> map, HttpServletRequest request){

        String fromUrI = request.getParameter("next");//获取上一次的转发路径
        String url;
        User findUser = userService.userLogin(user);
        if(findUser!=null){
           request.getSession().setAttribute("user",findUser);
           url= "redirect:"+fromUrI;
        }else{
            map.put("fromUrI",fromUrI);
            map.put("errorMessage","用户名或密码错误！");
            url = "forward:/views/login.jsp";
        }
        return url;
    }
    //用户注册
    @RequestMapping(value = "userRegister")
    public String register(User user, @RequestParam("file") MultipartFile file ,HttpServletRequest request){
        String fromUrl = request.getParameter("next");//获取上一次的转发路径
        //获取文件上传的文件名
        String originalFilename = file.getOriginalFilename();
        try {
            if(originalFilename.length() == 0){//如果用户没有上传头像
                //设置用户默认头像
                user.setUser_headimage("static/images/defaulthead.gif");
                //设置用户状态
                user.setUser_state(1);
                userService.userRegister(user);
                request.getSession().setAttribute("user",user);
            }else {
                //处理文件名
                String replace = UUID.randomUUID().toString().replace("-", "");
                String fileName =replace + originalFilename;

                //获取上传文件的存储地址
                String path_store = request.getServletContext().getRealPath("/upload/userHeadImages");
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
                //设置用户的头像路径
                user.setUser_headimage("upload/userHeadImages/"+fileName);
                //设置用户状态
                user.setUser_state(1);
                userService.userRegister(user);

                request.getSession().setAttribute("user",user);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:"+fromUrl;

    }
    @ResponseBody
    @RequestMapping(value = "checkUserName")
    public String checkUserName(@RequestParam("user_name") String user_name) throws JsonProcessingException {
        User user = userService.checkUserName(user_name);
        boolean states = false;
        if(user == null){
            states =true;
        }
        String s = objectMapper.writeValueAsString(states);
        System.out.println(s);
        return objectMapper.writeValueAsString(states);
    }
    //用户退出
    @RequestMapping(value = "onLogout")
    public String Logout(HttpServletRequest request){
        String next = request.getParameter("next");//获取上一次的转发路径
        String fromUrI = next.substring(6);
        request.getSession().removeAttribute("user");
        return "redirect:"+fromUrI;
    }

    //转发上一次的URI（保证从哪里登录，登录成功之后回哪里）
    @RequestMapping(value = "onclickLogin")
    public String onclickLogin(HttpServletRequest request, Map<String,Object> map){
        String next = request.getParameter("next");
        System.out.println(next);

        String fromUrI = next.substring(6);
        map.put("fromUrI",fromUrI);
        return "forward:/views/login.jsp";
    }
    @RequestMapping(value = "onclickRegister")
    public String onclickRegister(HttpServletRequest request,Map<String,Object> map){
        String next = request.getParameter("next");
        String fromUrI = next.substring(6);
        map.put("fromUrI",fromUrI);
        return "forward:/views/register.jsp";
    }
    @RequestMapping(value = "onclickRegisterNew")
    public String onclickRegisterNew(@RequestParam("next") String next,Map<String,Object> map){
//        String fromUrI = next.substring(6);
        map.put("fromUrI",next);
        return "forward:/views/register.jsp";
    }

    //提交评论
    @ResponseBody
    @RequestMapping(value = "submitComment")
    public String submitComment(HttpServletRequest request, Map<String,Object> map) throws JsonProcessingException {
        //获取绝对路径
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/";


        String w = request.getParameter("w");//获取评论内容
        System.out.println("w:"+w);
        User user = (User) request.getSession().getAttribute("user");//获取当前用户
        System.out.println("name"+user.getUser_name());
        map.put("currentComment", w);
        map.put("user",user);
        String jsonMap = objectMapper.writeValueAsString(map);

        //获取主评论人id
        String comment_parent = request.getParameter("comment_parent");
        if(Integer.parseInt(comment_parent) == 0){//表示是主评论
            System.out.println(Integer.parseInt(comment_parent));
            //为ArticleMainComment封装数据，向主评论表存入数据
            articleMainComment.setAmaincomment_content(this.getCurrentComment(w,basePath));//处理后的评论内容
            articleMainComment.setAmaincomment_time(new Date());//评论时间
            articleMainComment.setArticle_id(Integer.parseInt(request.getParameter("comment_post_ID")));//评论所属页面id
            articleMainComment.setUser(user);//当前评论人的信息
            articleMainComment.setHassubcomment(0);//表示当前评论没有子评论（回复评论）
            userService.submitComment(articleMainComment);//添加评论
            articleService.updateArticleCommentNum(Integer.parseInt(request.getParameter("comment_post_ID")));//修改文章评论数

        }else{
            //表示是回复的评论
            int mainCommentId = Integer.parseInt(request.getParameter("comment_main"));
            User userById = userService.findUserById(Integer.parseInt(comment_parent));//获取被评论人的信息
            //为ArticleSubComment封装数据，向子评论表存入数据
            articleSubComment.setAsubcomment_content(this.getCurrentComment(w,basePath));//处理后的评论内容
            articleSubComment.setAsubcomment_time(new Date());
            articleSubComment.setRespond_name(userById.getUser_name());//被评论人的名字
            articleSubComment.setArticle_id(Integer.parseInt(request.getParameter("comment_post_ID")));//评论所属页面id
            articleSubComment.setUser(user);//回复人信息
            articleSubComment.setAmaincomment_id(mainCommentId);//主评论id
            int mainCommentState = 1;//主评论状态
            userService.submitArticleSubComment(articleSubComment,mainCommentState,mainCommentId);//存入子评论
            articleService.updateArticleCommentNum(Integer.parseInt(request.getParameter("comment_post_ID")));//修改文章评论数
        }

        return jsonMap;
    }

    //处理当前评论（将相应的表情符号处理）
    public String getCurrentComment(String comment,String basePath){
        Map<String, String> smilieMap = smiliesMap.getSmiliesMap();
        StringBuffer currentComment= new StringBuffer();

        String replace = comment.replace(" ", "");//去除评论中的空格
        String[] split = replace.split(":");//根据:拆分评论内容
        for(int i=0;i<split.length;i++){
            if(!"".equals(split[i])){
                if(smilieMap.containsKey(split[i])){
                    currentComment.append("<img src=\"").append(basePath).append(smilieMap.get(split[i]));
                }else {
                    currentComment.append(split[i]);
                }
            }
        }
        return currentComment.toString();
    }
}
