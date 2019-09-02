package cn.dds.service;

import cn.dds.entity.ArticleMainComment;
import cn.dds.entity.ArticleSubComment;
import cn.dds.entity.User;
import cn.dds.mapper.UserMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource(name = "userMapper")
    private UserMapper userMapper;


    @Override
    public User userLogin(User user) {
        User users = userMapper.userLogin(user);
        return users;
    }

    @Override
    public void userRegister(User user) {
        userMapper.userRegister(user);
    }

    @Override
    public User checkUserName(String user_name) {
        return userMapper.checkUserName(user_name);
    }

    @Override
    public void submitComment(ArticleMainComment articleMainComment) {
        userMapper.submitComment(articleMainComment);
    }

    @Override
    public User findUserById(int user_id) {
        return userMapper.findUserById(user_id);
    }

    @Transactional
    @Override
    public void submitArticleSubComment(ArticleSubComment articleSubComment,int mainCommentState,int mainCommentId) {
        userMapper.submitArticleSubComment(articleSubComment);
        //修改主评论状态
        userMapper.updateArticleMainCommentState(mainCommentState,mainCommentId);
    }
}
