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
<html>
<head>
	<meta charset="UTF-8">
	<meta name="baidu-tc-verification" content="0fb041a64ee71333c957d8c784961cc8" />
	<meta property="qc:admins" content="145637425211673116375" />
	<meta http-equiv="X-UA-Compatible" content="IE=10,IE=9,IE=8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<title>静觅丨DDS的个人博客</title>
	<script>
        window._deel = {
            // name: '静觅',
            url: '<%=basePath%>',
            ajaxpager: 'on',
            commenton: 0,
            roll: [11, 12]
        }
	</script>


<!-- /all in one seo pack -->
	<link rel='dns-prefetch' href='//libs.baidu.com' />
	<link rel='stylesheet' id='crayon-css1'  href='<%=basePath%>static/css/font-awesome.css' type='text/css'  />
	<link rel='stylesheet' id='crayon-css2'  href='<%=basePath%>static/css/font-awesome.min.css' type='text/css' />
	<link rel='stylesheet' id='crayon-css'  href='<%=basePath%>static/css/crayon.min.css' type='text/css' media='all' />
	<link rel='stylesheet' id='crayon-theme-github-css'  href='<%=basePath%>static/css/github.css' type='text/css' media='all' />
	<link rel='stylesheet' id='crayon-font-monaco-css'  href='<%=basePath%>static/css/monaco.css' type='text/css' media='all' />
	<link rel='stylesheet' id='page-list-style-css'  href='<%=basePath%>static/css/page-list.css' type='text/css' media='all' />
	<link rel='stylesheet' id='l2h_style-css'  href='<%=basePath%>static/css/latex.min.css' type='text/css' media='screen, print' />
	<link rel='stylesheet' id='l2h_print_style-css'  href='<%=basePath%>static/css/print.min.css' type='text/css' media='print' />
	<link rel='stylesheet' id='style-css'  href='<%=basePath%>static/css/style.css' type='text/css' media='all' />
	<script type='text/javascript' src='<%=basePath%>static/js/jquery.min.js'></script>
	<script type='text/javascript'>
        /* <![CDATA[ */
        var CrayonSyntaxSettings = {
            "version": "_2.7.2_beta",
            "is_admin": "0",
          //  "ajaxurl": "https:\/\/cuiqingcai.com\/wp-admin\/admin-ajax.php",
            "prefix": "crayon-",
            "setting": "crayon-setting",
            "selected": "crayon-setting-selected",
            "changed": "crayon-setting-changed",
            "special": "crayon-setting-special",
            "orig_value": "data-orig-value",
            "debug": ""
        };
        var CrayonSyntaxStrings = {
            "copy": "\u4f7f\u7528 %s \u590d\u5236\uff0c\u4f7f\u7528 %s \u7c98\u8d34\u3002",
            "minimize": "\u70b9\u51fb\u5c55\u5f00\u4ee3\u7801"
        };
        /* ]]> */
	</script>
	<script type='text/javascript' src='<%=basePath%>static/js/crayon.min.js'></script>
	<%--<script type='text/javascript' src='${pageContext.request.contextPath}/static/js/jquery.fitvids.js'></script>--%>
	<%--<link rel='https://api.w.org/' href='https://cuiqingcai.com/wp-json/' />--%>

	<%--<script type="text/javascript">--%>
        <%--jQuery(document).ready( function() {--%>
            <%--jQuery('.video').fitVids();--%>
        <%--});--%>
	<%--</script><!--[if lt IE 9]>--%>
	<script src="<%=basePath%>static/js/html5.js"></script>

	<%--<script>--%>
        <%--var _hmt = _hmt || [];--%>
        <%--(function() {--%>
            <%--var hm = document.createElement("script");--%>
            <%--hm.src = "//hm.baidu.com/hm.js?3ef185224776ec2561c9f7066ead4f24";--%>
            <%--var s = document.getElementsByTagName("script")[0];--%>
            <%--s.parentNode.insertBefore(hm, s);--%>
        <%--})();--%>
	<%--</script>--%>

	<%--<script type="text/javascript" name="baidu-tc-cerfication" data-appid="5411405" src="${pageContext.request.contextPath}/static/js/lightapp.js"></script>--%>
	<%--<link rel="shortcut icon" type="image/x-icon" href="https://cuiqingcai.com/fav.png" />--%>
	<%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/main.js"></script>--%>
</head>

<body class="home blog">
    <!-- 引入header.jsp -->
    <jsp:include page="/views/header.jsp"/>

<section class="container">
    <!--引入公告栏-->
    <jsp:include page="/views/notice.jsp"/>

	<div class="content-wrap">
	    <div class="content">
			<div id="wowslider-container1">
				<!--轮播图模块-->
				<div class="ws_images">
					<ul>
						<c:forEach items="${requestScope.hotArticles}" var="hotArticle">
							<li><a target="_blank" href="${pageContext.request.contextPath}/ArticleDetails/${hotArticle.article_id}" title="${hotArticle.article_title}"><img src="${pageContext.request.contextPath}/${hotArticle.article_picture}" title="${hotArticle.article_title}" alt="${hotArticle.article_title}" /></a></li>
						</c:forEach>

					</ul>
				</div>
				<!--轮播图模块左侧-->
				<div class="ws_thumbs">
					<div>
						<c:forEach items="${requestScope.hotArticles}" var="hotArticle">
							<a target="_blank" href="#" title="${hotArticle.article_title}"><img src="${pageContext.request.contextPath}/${hotArticle.article_picture}" /></a>
						</c:forEach>
					</div>
				</div>
				<div class="ws_shadow"></div>
			</div>
			
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/slider.js"></script>
	
	<div>
		<div class="left-ad" style="clear: both;background-color: #fff; width: 30%;float: left;margin-right:2%;">
		</div>
		<div class="hot-posts">
		    <h2 class="title">热门排行</h2>
			<ul>
				<c:forEach items="${requestScope.hotArticles}" var="hotArticle" varStatus="vs">
					<li>
						<span class="label label-1">${vs.count}</span><a href="${pageContext.request.contextPath}/ArticleDetails/${hotArticle.article_id}" title="${hotArticle.article_title}">${hotArticle.article_title}</a>
						<p><span class="muted"><a href="javascript:void(0)" data-action="ding" data-id="${hotArticle.article_id}" id="Addlike" class="action"><i class="fa fa-heart-o"></i><span class="count">${hotArticle.article_loves}</span> 喜欢</a></span></p>
					</li>
				</c:forEach>

			</ul>
		</div>
	</div>
			<c:forEach items="${requestScope.homePageArticles}" var="article">
				<!--第一篇文章-->
				<article class="excerpt">
					<header>
						<!--文章标签-->
						<a class="label label-important" href="javascript:void(0)">${article.label.label_name}<i class="label-arrow"></i></a>
						<!--文章标题-->
						<h2><a target="_blank" href="${pageContext.request.contextPath}/ArticleDetails/${article.article_id}" title="${article.article_title}">${article.article_title}</a></h2>
					</header>
					<div class="focus" style="height: 125px;width:200px">
						<a target="_blank" href="${pageContext.request.contextPath}/ArticleDetails/${article.article_id}"><img class="thumb" src="${pageContext.request.contextPath}/${article.article_picture}" width="auto"  height="auto" alt="${article.article_title}" /></a>
					</div>
					<!--文章简介-->
					<span class="note">${article.article_synopsis}</span>
					<p class="auth-span">
						<span class="muted"><i class="fa fa-user"></i> <a href="javascript:void(0)">${article.article_author}</a></span>
						<span class="muted"><i class="fa fa-clock-o"></i>${article.article_time}</span>
						<span class="muted"><i class="fa fa-eye"></i> ${article.article_visits}浏览</span>
						<span class="muted"><i class="fa fa-comments-o"></i><a target="_blank" href="${pageContext.request.contextPath}/ArticleDetails/${article.article_id}">${article.article_comment}评论</a></span>
						<span class="muted"><a href="javascript:void(0)" data-action="ding" data-id="${article.article_id}" id="Addlike" class="action"><i class="fa fa-heart-o"></i><span class="count">${article.article_loves}</span>喜欢</a></span>
					</p>
				</article>
			</c:forEach>

	

	
		<div class="pagination">
			<ul>
				<li class="prev-page"></li>
				<%--<li class="active"><span>1</span></li>--%>
				<%--<li><a href='https://cuiqingcai.com/page/2'>2</a></li>--%>
				<%--<li><a href='https://cuiqingcai.com/page/3'>3</a></li>--%>
				<%--<li><a href='https://cuiqingcai.com/page/4'>4</a></li>--%>
				<%--<li><a href='https://cuiqingcai.com/page/5'>5</a></li>--%>
				<%--<li><span> ... </span></li>--%>
                <%--<li class="next-page"><a href="https://cuiqingcai.com/page/2" >下一页</a></li>--%>
                <c:if test="${!empty requestScope.Pages}">
						<li class="next-page"><a href="<%=basePath%>queryArticleWidthPageHelper/${requestScope.Pages}" >下一页</a></li>
                </c:if>
				<%--<li class="next-page"><a href="<%=basePath%>queryArticleWidthPageHelper/${requestScope.Pages}" >下一页</a></li>--%>
			</ul>
		</div>	
	</div>
</div>
    <!-- 引入right.jsp -->
    <jsp:include page="/views/right.jsp"/>

</section>
    <!-- 引入footer.jsp -->
    <jsp:include page="/views/footer.jsp"/>

    <link rel='stylesheet' id='metaslider-nivo-slider-css'  href='<%=basePath%>static/css/nivo-slider.css' type='text/css' media='all' property='stylesheet' />
    <link rel='stylesheet' id='metaslider-public-css'  href='<%=basePath%>static/css/public.css' type='text/css' media='all' property='stylesheet' />
    <link rel='stylesheet' id='metaslider-nivo-slider-bar-css'  href='<%=basePath%>static/css/bar.css' type='text/css' media='all' property='stylesheet' />

    <script type='text/javascript' src='<%=basePath%>static/js/jquery.js'></script>
    <!--无影响-->
    <script type='text/javascript' src='<%=basePath%>static/js/wp-embed.min.js'></script>

    <!--控制热门专题轮播图-->
	<script type='text/javascript' src='<%=basePath%>static/js/jquery.nivo.slider.pack.js'></script>
    <!-- xuanfu -->

    <!--无影响-->
    <script src="<%=basePath%>static/js/s.js" type="text/javascript"></script>

</body>
</html>
<!-- Dynamic page generated in 1.148 seconds. -->
<!-- Cached page generated by WP-Super-Cache on 2019-02-18 20:33:39 -->

<!-- super cache -->