package cn.dds.service;

import cn.dds.entity.ArticleMainComment;
import cn.dds.entity.ArticleSubComment;
import cn.dds.entity.User;

public interface UserService {
    /**
     *用户登录
     * @param user
     * @return
     */
    User userLogin(User user);

    /**
     * 用户注册
     * @param user
     */
    void userRegister(User user);

    /**
     * 根据用户名查询是否有此用户
     *  @param user_name
     * @return
     */
    User checkUserName(String user_name);
    /**
     *向主评论表插入数据
     * @param articleMainComment
     */
    void submitComment(ArticleMainComment articleMainComment);

    /**
     *
     * @param user_id
     * @return
     */
    User findUserById(int user_id);

    /**
     * 向子评论表插入数据
     * @param articleSubComment
     */
    void submitArticleSubComment(ArticleSubComment articleSubComment,int mainCommentState,int mainCommentId);

}
