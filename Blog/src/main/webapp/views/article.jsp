<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
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
    <meta name="baidu-tc-verification" content="0fb041a64ee71333c957d8c784961cc8"/>
    <meta property="qc:admins" content="145637425211673116375"/>
    <meta http-equiv="X-UA-Compatible" content="IE=10,IE=9,IE=8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <title>静觅丨DDS的个人博客</title>
    <script>
        window._deel = {
            name: '静觅',
            url: '<%=basePath%>',
            ajaxpager: 'on',
            commenton: 0,
            roll: [11, 12]
        }
    </script>



    <!-- /all in one seo pack -->
    <link rel='dns-prefetch' href='//libs.baidu.com'/>
    <link rel='stylesheet' id='crayon-css' href='<%=basePath%>static/font-awesome-4.7.0/css/font-awesome.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='crayon-css' href='<%=basePath%>static/font-awesome-4.7.0/css/font-awesome.min.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='crayon-css' href='<%=basePath%>static/css/crayon.min.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='crayon-theme-github-css' href='<%=basePath%>static/css/github.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='crayon-font-monaco-css' href='<%=basePath%>static/css/monaco.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='page-list-style-css' href='<%=basePath%>static/css/page-list.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='l2h_style-css' href='<%=basePath%>static/css/latex.min.css' type='text/css' media='screen, print'/>
    <link rel='stylesheet' id='l2h_print_style-css' href='<%=basePath%>static/css/print.min.css' type='text/css' media='print'/>
    <link rel='stylesheet' id='style-css' href='<%=basePath%>static/css/style.css' type='text/css' media='all'/>
    <script type='text/javascript' src='<%=basePath%>static/js/jquery.min.js'></script>
    <script type='text/javascript'>
        /* <![CDATA[ */
        var CrayonSyntaxSettings = {
            "version": "_2.7.2_beta",
            "is_admin": "0",
            "ajaxurl": "https:\/\/cuiqingcai.com\/wp-admin\/admin-ajax.php",
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
    <script type='text/javascript' src='<%=basePath%>static/js/jquery.fitvids.js'></script>
    <%--<link rel='https://api.w.org/' href='https://cuiqingcai.com/wp-json/'/>--%>

    <!--[if lt IE 9]>
    <script src="<%=basePath%>static/js/html5.js"></script><![endif]-->
    <meta name="360-site-verification" content="bdc579accc68a98f1258ebcce2266afa"/>
    <script type="text/javascript" name="baidu-tc-cerfication" data-appid="5411405" src="<%=basePath%>static/js/lightapp.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/js/main.js"></script>

    <script>
           $(function () {
               ShowSubComment = function (ShowSubComment_id) {
                   var  aMainComment_id = ShowSubComment_id;

                   $.ajax({
                       url:"<%=basePath%>findSubComments",
                       type:"POST",
                       data:{"aMainComment_id":aMainComment_id},
                       success:function (data) {
                           var subcontent="";
                           for(var i=0;i<data.length;i++){
                               var divid='"'+"div-comment--"+data[i].asubcomment_id+'"';
                               var user_id ='"'+data[i].user.user_id+'"';
                               var amaincomment_id='"'+data[i].amaincomment_id+'"';
                               var article_id ='"'+data[i].article_id+'"';

                                 subcontent+=" <ul class='children' id='children-"+data[i].asubcomment_id+"'>"+
                                 "<li class='comment odd alt depth-2' id='comment--"+data[i].asubcomment_id+"'>" +
                                 "<div class='c-avatar'>" +
                                 "<img alt='用户头像' src='../"+data[i].user.user_headimage+"' class='avatar avatar-54 photo' height='54' width='54' style='border-radius: 50%;'/>" +
                                 "<div class='c-main' id='div-comment--"+data[i].asubcomment_id+"'>" +
                                 "<p>"+data[i].asubcomment_content+"</p>" +
                                 "<div class='c-meta'>" +
                                 "<span class='c-author'>" +
                                 "<a href='javascript:void(0)' rel='external nofollow'class='url'><strong>"+data[i].user.user_name+"</strong></a>" +
                                 "回复："+data[i].respond_name+"</span>" +
                                     ""+data[i].asubcomment_time+"" +
                                 "<a rel='nofollow'class='comment-reply-link' href='javascript:void(0)' onclick='return addComment.moveForm("+divid+","+user_id+",\"respond\","+article_id+","+amaincomment_id+")'aria-label='回复给"+data[i].user.user_name+"' >回复</a>" +
                                 "</div>" +
                                 "</div>" +
                                 "</div>" +
                                 "</li>" +
                                     " </ul>" ;
                           }
                           var sid="children-"+aMainComment_id;
                           var sele = $("div[id="+sid+"]");
                           sele.slideDown();
                           sele.html(subcontent);
                       },
                       dataType:"json"
                   });
               };
               HideSubComment = function (HidSubComment_id) {
                   var hidSubComment = "children-"+HidSubComment_id;
                   $("div[id="+hidSubComment+"]").slideUp();
               }
               
           })
    </script>
</head>
<body class="home blog">
        <!-- 引入header.jsp -->
        <jsp:include page="/views/header.jsp"/>

<section class="container">
        <!--引入公告栏-->
        <jsp:include page="/views/notice.jsp"/>

    <!--右侧内容区-->
    <%--"<a rel='nofollow'class='comment-reply-link' href='javascript:void(0)' onclick='return addComment.moveForm("+divid+","+data[i].user.user_id+",\"respond\",\"1\","+data[i].amaincomment_id+")'aria-label='回复给"+data[i].user.user_name+"' >回复</a>"--%>
    <div class="content-wrap">
        <div class="content">
            <div class="breadcrumbs">
                <a title="返回首页" href="${pageContext.request.contextPath}/InitHomePage"><i class="fa fa-home"></i></a>
                <small>></small>
                <a href="${pageContext.request.contextPath}/Article_Category/${requestScope.articleDetails.category.category_id}">${requestScope.articleDetails.category.category_name}</a>
                <small>></small>
                <a href="${pageContext.request.contextPath}/Article_Catalogue/${requestScope.articleDetails.catalogue.catalogue_id}">${requestScope.articleDetails.catalogue.catalogue_name}</a>
                <small>></small>
                <span class="muted">${requestScope.articleDetails.article_title}</span>
            </div>
            <header class="article-header">
                <h1 class="article-title"><a href="javascript:void(0)">${requestScope.articleDetails.article_title}</a></h1>
                <div class="meta">
                    <span id="mute-category" class="muted">
                        <i class="fa fa-list-alt"></i>
                        <a href="${pageContext.request.contextPath}/Article_Catalogue/${requestScope.articleDetails.catalogue.catalogue_id}">${requestScope.articleDetails.catalogue.catalogue_name}</a>
                    </span>
                    <span class="muted">
                        <i class="fa fa-user"></i>
                        <a href="javascript:void(0)">${requestScope.articleDetails.article_author}</a>
                    </span>
                    <time class="muted"><i class="fa fa-clock-o"></i>${requestScope.articleDetails.article_time}</time>
                    <span class="muted"><i class="fa fa-eye"></i> ${requestScope.articleDetails.article_visits}浏览</span>
                    <span class="muted">
                        <i class="fa fa-comments-o"></i>
                        <a href="javascript:void(0)">${requestScope.articleDetails.article_comment}评论</a>
                    </span>
                </div>
            </header>
            <article class="article-content">
                <table>
                    <tr>
                        <td bgcolor=#e2dede text-align:center>每篇小记都是随性的开始，从来不知道落笔在何处</td>
                    </tr>
                </table>
                ${requestScope.articleDetails.article_content}

                <p>转载请注明：
                    <a href="javascript:void(0)">${requestScope.articleDetails.article_author}</a> &raquo;
                    <a href="javascript:void(0)">${requestScope.articleDetails.article_title}</a>
                </p>
                <div id="outerdiv"
                     style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
                    <div id="innerdiv" style="position:absolute;">
                        <img id="bigimg" style="border:5px solid #fff;" src=""/>
                    </div>
                </div>

                <div class="article-social">
                    <a href="javascript:;" data-action="ding" data-id="${requestScope.articleDetails.article_id}" id="Addlike" class="action">
                        <i class="fa fa-heart-o"></i>喜欢 (<span class="count">${requestScope.articleDetails.article_loves}</span>)
                    </a>
                    <span class="or">or</span>
                    <span class="action action-share bdsharebuttonbox"><i class="fa fa-share-alt"></i>分享 (
						<span class="bds_count" data-cmd="count" title="累计分享0次">0</span>)
						<div class="action-popover">
							<div class="popover top in">
								<div class="arrow">
								</div>
									<div class="popover-content">
										<a href="#" class="sinaweibo fa fa-weibo" data-cmd="tsina" title="分享到新浪微博"></a>
										<a href="#" class="bds_qzone fa fa-star" data-cmd="qzone" title="分享到QQ空间"></a>
										<a href="#" class="tencentweibo fa fa-tencent-weibo" data-cmd="tqq" title="分享到腾讯微博"></a>
										<a href="#" class="qq fa fa-qq" data-cmd="sqq" title="分享到QQ好友"></a>
										<a href="#" class="bds_renren fa fa-renren" data-cmd="renren" title="分享到人人网"></a>
										<a href="#" class="bds_weixin fa fa-weixin" data-cmd="weixin" title="分享到微信"></a>
										<a href="#" class="bds_more fa fa-ellipsis-h" data-cmd="more"></a>
									</div>
							</div>
						</div>
					</span>
                </div>
            </article>

            <div class="">
                <!--删除了一大堆没使用样式-->
            </div>


            <div id="respond" class="no_webshot">
                <form action="${pageContext.request.contextPath}/submitComment" method="post" id="commentform">
                    <div class="comt-title">
                        <div class="comt-author pull-left" id="nick">
                        </div>
                        <a id="cancel-comment-reply-link" class="pull-right" href="javascript:;">取消评论</a>
                    </div>
                    <div class="comt">
                        <div class="comt-box">
                            <h3>发表我的评论</h3>
                            <c:if test="${empty sessionScope.user}">
                                <div class="card mt-2 rounded-0 border-0" id="comment-block">
                                    <div class="card border-0 rounded-0 f-16" id="editor-block">
                                        <div class="card-body text-center m-2 m-md-3 f-16" id="no-editor">
                                            <div>您尚未登录，请
                                                <a class="text-danger" href="<%=basePath%>onclickLogin?next=${requestScope.fromUrl}">登录</a> 或
                                                <a class="text-danger" href="<%=basePath%>onclickRegister?next=${requestScope.fromUrl}">注册</a>
                                                后评论
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${!empty sessionScope.user}">
                                <textarea placeholder="写点什么..." class="input-block-level comt-area" name="w" id="comment" cols="100%" rows="3" tabindex="1"></textarea>
                            </c:if>


                            <div class="comt-ctrl">
                                <button class="btn btn-primary pull-right" type="submit" name="submit" id="submit" tabindex="5">
                                    <i class="fa fa-check-square-o"></i> 提交评论
                                </button>
                                <div class="comt-tips pull-right">
                                    <input type='hidden' name='comment_post_ID' value='${requestScope.articleDetails.article_id}' id='comment_post_ID'/>
                                    <input type='hidden' name='comment_parent' id='comment_parent' value='0'/>
                                    <input type='hidden' name='comment_main' id='comment_main' value='1'/>
                                    <p style="display: none;">
                                        <input type="hidden" id="akismet_comment_nonce" name="akismet_comment_nonce" value="da9dc5c77a"/>
                                    </p>
                                    <p style="display: none;">
                                        <input type="hidden" id="ak_js" name="ak_js" value="50"/>
                                    </p>
                                </div>
                                <span data-type="comment-insert-smilie" class="muted comt-smilie"><i class="fa fa-smile-o"></i> 表情</span>
                                <span class="muted comt-mailme">
                                    <label for="comment_mail_notify" class="checkbox inline" style="padding-top:0">
                                        <input type="checkbox" name="comment_mail_notify" id="comment_mail_notify" value="comment_mail_notify" checked="checked"/>有人回复时邮件通知我
                                    </label>
							    </span>
                            </div>
                        </div>

                        <%--<div class="comt-comterinfo" id="comment-author-info">--%>
                        <%--<h4>Hi，您需要填写昵称和邮箱！</h4>--%>
                        <%--<ul>--%>
                            <%--<li class="form-inline">--%>
                                <%--<label class="hide" for="author">昵称</label>--%>
                                <%--<input class="ipt" type="text" name="author" id="author" value="" tabindex="2"--%>
                                       <%--placeholder="昵称">--%>
                                <%--<span class="help-inline">昵称 (必填)</span>--%>
                            <%--</li>--%>
                            <%--<li class="form-inline">--%>
                                <%--<label class="hide" for="email">邮箱</label>--%>
                                <%--<input class="ipt" type="text" name="email" id="email" value="" tabindex="3"--%>
                                       <%--placeholder="邮箱">--%>
                                <%--<span class="help-inline">邮箱 (必填)</span>--%>
                            <%--</li>--%>
                            <%--<li class="form-inline">--%>
                                <%--<label class="hide" for="url">网址</label>--%>
                                <%--<input class="ipt" type="text" name="url" id="url" value="" tabindex="4"--%>
                                       <%--placeholder="网址">--%>
                                <%--<span class="help-inline">网址</span>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                    </div>
                </form>
            </div>
            <!--评论区-->
            <div id="postcomments">
                <div id="comments">
                    <i class="fa fa-comments-o"></i> <b> (${requestScope.debunks})</b>个小伙伴在吐槽
                </div>
                <ol class='commentlist'>
                    <c:forEach items="${requestScope.articleMainComments}" var="articleMainComment" varStatus="vs">
                    <li class="comment even thread-even depth-1" id="comment-5">
                        <div class="c-avatar">
                            <img alt='用户头像' src='<%=basePath%>${articleMainComment.user.user_headimage}' class='avatar avatar-54 photo' height='54' width='54' style="border-radius: 50%;"/>
                            <%--id="div-comment-20"--%>
                            <div class="c-main" id="div-comment-${vs.count}">
                                <p>
                                    ${articleMainComment.amaincomment_content}
                                </p>
                                <div class="c-meta">
                                    <span class="c-author"><a href='' rel='external nofollow' class='url'>${articleMainComment.user.user_name}</a></span>${articleMainComment.amaincomment_time}
                                    <c:if test="${articleMainComment.hassubcomment == 1}">
                                        <a id="View-Response" href="javascript:void(0)" onclick='ShowSubComment("${articleMainComment.amaincomment_id}")'>查看回复</a>
                                        <a id="Hide-Response" href="javascript:void(0)" onclick='HideSubComment("${articleMainComment.amaincomment_id}")'>收起回复</a>
                                    </c:if>
                                    <a rel='nofollow' class='comment-reply-link'href='${pageContext.request.contextPath}/submitComment' onclick='return addComment.moveForm( "div-comment-${vs.count}", "${articleMainComment.user.user_id}", "respond", "${requestScope.articleDetails.article_id}","${articleMainComment.amaincomment_id}" )' aria-label='回复给${articleMainComment.user.user_name}'>回复</a>
                                </div>
                            </div>
                        </div>
                    </li>
                        
                        <div id="children-${articleMainComment.amaincomment_id}">



                        </div>

                    </c:forEach>
                </ol>

            </div>

        </div>
    </div>

    <!--左侧内容区结束-->

    <!--右侧信息标签广告区-->
    <!-- 引入right.jsp -->
    <jsp:include page="/views/right.jsp"/>
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

</section>
        <!-- 引入footer.jsp -->
        <jsp:include page="/views/footer.jsp"/>
</body>
<!--左侧内容区结束-->
</html>
