<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/22
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML>
<aside class="sidebar">
    <div class="widget widget_text">
        <div class="textwidget">
            <div class="social">
                <%--<a href="https://weibo.com/cuiqingcai" rel="external nofollow" title="新浪微博" target="_blank"><i class="sinaweibo fa fa-weibo"></i></a>--%>
                <a href="https://github.com/dds-sam?tab=projects" rel="external nofollow" title="Github" target="_blank"><i class="tencentweibo fa fa-github"></i></a>
                <a class="weixin"><i class="weixins fa fa-weixin"></i>
                    <div class="weixin-popover">
                        <div class="popover bottom in">
                            <div class="arrow"></div>
                            <div class="popover-title"></div>
                            <div class="popover-content"><img src="${pageContext.request.contextPath}/static/images/mywechat.png" ></div>
                        </div>
                    </div>
                </a>
                <a href="javascript:void(0)" rel="external nofollow" title="Email" ><i class="email fa fa-envelope-o"></i></a>
                <%--<a href="?feed=rss2" rel="external nofollow" target="_blank"  title="订阅本站"><i class="rss fa fa-rss"></i></a>--%>
            </div>
        </div>
    </div>

    <div class="widget widget_metaslider_widget">
        <div class="title">
            <h2>热门专题</h2>
        </div><!-- meta slider -->
        <div style="width: 100%;" class="metaslider metaslider-nivo metaslider-2698 ml-slider meta-slider">
            <div id="metaslider_container_2698">
                <div class='slider-wrapper theme-bar'>
                    <div class='ribbon'></div>
                    <div id='metaslider_2698' class='nivoSlider'>
                        <c:forEach items="${requestScope.hotArticles}" var="hotArticle">
                            <a href="${pageContext.request.contextPath}/ArticleDetails/${hotArticle.article_id}" target="_blank"><img src="${pageContext.request.contextPath}/${hotArticle.article_picture}" height="300" width="320" data-title="${hotArticle.article_title}" title="${hotArticle.article_title}" alt="${hotArticle.article_title}" class="slider-2698 slide-1720" /></a>
                        </c:forEach>
                        <%--<a href="https://cuiqingcai.com/1052.html" target="_blank"><img src="${pageContext.request.contextPath}/static/images/7e5f0c69ec05566ec08d9ba655d49da5.jpg" height="300" width="320" data-title="Python爬虫学习系列教程" title="Python爬虫学习系列教程" alt="Python爬虫学习系列教程" class="slider-2698 slide-1720" /></a>--%>
                        <%--<a href="https://cuiqingcai.com/4320.html" target="_blank"><img src="${pageContext.request.contextPath}/static/images/9822ba3156033a66d30b8b6ee4a6fbbd.jpeg" height="300" width="320" data-title="Python3爬虫学习视频教程" title="OpenGL绘图系列教程" alt="OpenGL绘图系列教程" class="slider-2698 slide-951" /></a>--%>
                        <%--<a href="https://cuiqingcai.com/4352.html" target="_blank"><img src="${pageContext.request.contextPath}/static/images/886ac058df698aa815bf71fd0a86ab17.jpg" height="300" width="320" data-title="小白学爬虫系列教程" alt="" class="slider-2698 slide-4372" /></a>--%>
                    </div>
                </div>
            </div>
            <!--控制热门专题轮播图-->
            <script type="text/javascript">
                var metaslider_2698 = function($) {
                    $('#metaslider_2698').nivoSlider({
                        boxCols:7,
                        boxRows:5,
                        pauseTime:3000,
                        effect:"random",
                        controlNav:false,
                        directionNav:true,
                        pauseOnHover:true,
                        animSpeed:600,
                        prevText:"&lt;",
                        nextText:"&gt;",
                        slices:15,
                        manualAdvance:false
                    });
                };
                var timer_metaslider_2698 = function() {
                    var slider = !window.jQuery ? window.setTimeout(timer_metaslider_2698, 100) : !jQuery.isReady ? window.setTimeout(timer_metaslider_2698, 1) : metaslider_2698(window.jQuery);
                };
                timer_metaslider_2698();
            </script>
        </div>
        <!--// meta slider-->
    </div>
    <!--广告栏块-->
    <div class="widget widget_text">
        <div class="textwidget">
            <p><a href="javascript:void(0)"><img style="width: 100%;" src="${pageContext.request.contextPath}/static/images/index5.jpg" /><br /></a>
            </p>
        </div>
    </div>
    <div class="widget widget_text">
        <div class="textwidget">
            <a href="javascript:void(0)"><img style="width:100%" src=""/></a>
        </div>
    </div>
    <div class="widget widget_archive">
        <div class="title">
            <h2>文章归档</h2>
        </div>
        <ul>
            <c:forEach items="${requestScope.articleFile}" var="file">
                <li><a href='<%=basePath%>queryArticleByTime/${file}'>${file}</a></li>
            </c:forEach>

        </ul>
    </div>
    <div class="widget d_tag">
        <div class="title">
            <h2>标签云</h2>
        </div>
        <div class="d_tags">
            <c:forEach items="${requestScope.labels}" var="label">
                <a title="${label.label_number}个话题" href="<%=basePath%>Article_Label/${label.label_id}">${label.label_name}(${label.label_number})</a>
            </c:forEach>

        </div>
    </div>
    <div class="widget widget_links">
        <div class="title">
            <h2>友情链接</h2>
        </div>
        <%--<ul class='xoxo blogroll'>--%>
            <%--<li><a href="http://www.99banzou.com" target="_blank">99伴奏网</a></li>--%>
            <%--<li><a href="http://www.anotherhome.net" target="_blank">Anotherhome</a></li>--%>
            <%--<li><a href="http://zhouchenwen.com" rel="acquaintance" target="_blank">ColdCoder</a></li>--%>
            <%--<li><a href="https://www.3maio.com" target="_blank">Cpphp</a></li>--%>
            <%--<li><a href="http://www.spotty.com.cn/" target="_blank">DevNews</a></li>--%>
            <%--<li><a href="http://www.findspace.name" target="_blank">Findspace</a></li>--%>
        <%--</ul>--%>
    </div>
    <div class="widget widget_text">
        <div class="title">
            <h2>精品推荐</h2>
        </div>
    </div>

</aside>