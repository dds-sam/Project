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
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>写文章-DDS博客管理系统</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="<%=basePath%>admin/images/icon/icon.png">
<link rel="shortcut icon" href="<%=basePath%>admin/images/icon/favicon.ico">
<!--<script src="lib/ueditor/dialogs/image/image.js"></script>-->
<script type="text/javascript" charset="utf-8"  src="<%=basePath%>admin/editor/src/jquery-2.0.3.js"></script>
	
<link rel="stylesheet" href="<%=basePath%>admin/editor/css/editormd.css" />
	
<script type="text/javascript" charset="utf-8" src="<%=basePath%>admin/editor/src/editormd.js"></script>
  <script type="text/javascript" charset="utf-8" src="<%=basePath%>admin/editor/src/editormd.min.js"></script>

<!--&lt;!&ndash;[if gte IE 9]>-->
  <!--<script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>-->
  <!--<script src="js/html5shiv.min.js" type="text/javascript"></script>-->
  <!--<script src="js/respond.min.js" type="text/javascript"></script>-->
  <!--<script src="js/selectivizr-min.js" type="text/javascript"></script>-->
<!--<![endif]&ndash;&gt;-->
<!--&lt;!&ndash;[if lt IE 9]>-->
  <!--<script>window.location.href='upgrade-browser.html';</script>-->
<!--<![endif]&ndash;&gt;-->
<script>
     var testEditor;
        $(function() {
		
            testEditor = editormd("test-editormd", {
                width   : "100%", 
                height  : 600,
                syncScrolling : "single",
                saveHTMLToTextarea : true, //设置可保存为html 获取的时候testEditor.getHtml();就可以了
                theme : "dark", //设置主题，有默认
                previewTheme : "dark",
                editorTheme : "pastel-on-dark",
                searchReplace : true,
                emoji : false,
                taskList : true,
                tocm            : true,         // Using [TOCM]
                tex : true,                   // 开启科学公式TeX语言支持，默认关闭
                flowChart : true,             // 开启流程图支持，默认关闭
                sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
                dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
                imageUpload : true,
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "<%=basePath%>uploadArticlePictures",
                path    : "<%=basePath%>admin/editor/lib/"
            });

            firstSelect = function () {
               var category_id = $("#category").val();
                 if(category_id!==""){
                     $("#catalogue").empty();//清空select标签中的值
                   $.ajax({
                       async:false,
                       url:"<%=basePath%>provideCatalogue",
                       type:"POST",
                       data:{"category_id":category_id},
                       success:function (data) {
                           var cataloguehtml = "";
                           for(var i=0;i<data.length;i++){
                               cataloguehtml+="<option value='"+data[i].catalogue_id+"'>"+data[i].catalogue_name+"</option>"
                           }
                           $("#catalogue").append(cataloguehtml);

                       },
                       dataType:"json"
                   })
                 }
            }
			
        });
  </script>
</head>

<body class="user-select">
<section class="container-fluid">
  <!-- 引入head.jsp -->
  <jsp:include page="head.jsp"/>
  
  <div class="row">
    <!--引入右侧菜单栏-->
    <jsp:include page="menu.jsp"/>

    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <div class="row">
        <form action="<%=basePath%>adminAddArticle" method="post" class="add-article-form" enctype="multipart/form-data">
		
          <div class="col-md-12">
            <h1 class="page-header">撰写新文章</h1>
            <div class="form-group">
              <label for="article-title" class="sr-only">标题</label>
              <h2 class="add-article-box-title"><span>文章标题</span></h2>
              <input type="text" id="article-title" name="article_title" class="form-control" placeholder="在此处输入标题" required autofocus autocomplete="off">
            </div>

            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>文章简介</span></h2>
              <div class="add-article-box-content">
                <textarea class="form-control" name="article_synopsis" autocomplete="off"></textarea>
                <span class="prompt-text">文章简介：是对当前文章的简单介绍</span>
              </div>
            </div>

			<!--文章内容-->
            <div class="form-group">
			  <div id="test-editormd">
                  <textarea name="blogContent" id="blogContent"></textarea>
              </div>
            </div>
          </div>

		  
        <div class="col-md-12">
            <h1 class="page-header">操作</h1>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>一级目录</span></h2>
              <div class="add-article-box-content">
                <label for="category"></label>
                <select id="category" name="category.category_id" class="category-list" onchange="firstSelect()">
                    <option value="">--请选择--</option>
                    <c:forEach items="${requestScope.categories}" var="category">
                      <option value="${category.category_id}">${category.category_name}</option>
                    </c:forEach>
                  </select>
              </div>
            </div>

          <div class="add-article-box">
            <h2 class="add-article-box-title"><span>二级目录</span></h2>
            <div class="add-article-box-content">
              <label for="catalogue"></label>
              <select id="catalogue" name="catalogue.catalogue_id" class="category-list">
              </select>
            </div>
          </div>

            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>标签</span></h2>
              <div class="add-article-box-content">
                <label for="label"></label>
                <select id="label" name="label.label_id" class="category-list">
                  <option value="">--请选择--</option>
                  <c:forEach items="${requestScope.labels}" var="label">
                    <option value="${label.label_id}">${label.label_name}</option>
                  </c:forEach>
                </select>
              </div>
            </div>


            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>文章配图</span></h2>
              <div class="add-article-box-content">
                <input type="file" class="form-control" placeholder="点击按钮选择图片" id="pictureUpload" name="file" autocomplete="off">
              </div>
            </div>


           <div class="add-article-box">
              <h2 class="add-article-box-title"><span>发布</span></h2>
              <div class="add-article-box-content">
              	<p><label>状态：</label><span class="article-status-display">未发布</span></p>
                <p><label>公开度：</label><input type="radio" name="visibility" value="0" checked/>公开 <input type="radio" name="visibility" value="1" />加密</p>
                <p><label>发布于：</label><span class="article-time-display"><input style="border: none;" type="datetime" name="time" value="2016-01-09 17:29:37" /></span></p>
              </div>
              <div class="add-article-box-footer">
                <button class="btn btn-primary" type="submit" name="submit">发布</button>
              </div>
            </div>
          </div>
		  
        </form>
      </div>
    </div>
  </div>
</section>
  <!--引入各种弹出层-->
  <jsp:include page="popLayer.jsp"/>



<script src="<%=basePath%>admin/js/bootstrap.min.js"></script>
<script src="<%=basePath%>admin/js/admin-scripts.js"></script>


</body>
</html>
