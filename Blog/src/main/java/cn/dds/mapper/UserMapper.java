package cn.dds.mapper;

import cn.dds.entity.ArticleMainComment;
import cn.dds.entity.ArticleSubComment;
import cn.dds.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    /**
     *
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
     *
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
    void submitArticleSubComment(ArticleSubComment articleSubComment);

    /**
     * 通过主评论id修改状态
     * @param state
     * @param mainCommentId
     */
    void updateArticleMainCommentState(int state,int mainCommentId);

}
