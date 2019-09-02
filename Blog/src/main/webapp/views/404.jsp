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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Viewport metatags -->
    <meta name="HandheldFriendly" content="true"/>
    <meta name="MobileOptimized" content="320"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/dandelion.css" media="screen"/>
    <title>404</title>
</head>

<body>

<!-- Main Wrapper. Set this to 'fixed' for fixed layout and 'fluid' for fluid layout' -->
<div id="da-wrapper" class="fluid">

    <!-- Content -->
    <div id="da-content">
        <!-- Container -->
        <div class="da-container clearfix">
            <div id="da-error-wrapper">
                <div id="da-error-pin">

                </div>
                <div id="da-error-code">
                    error <span>404</span>
                </div>

                <h1 class="da-error-heading">${requestScope.message}</h1>
                <%--<h1 class="da-error-heading">${requestScope.url}</h1>--%>
                <%--<h1 class="da-error-heading">${requestScope.message}</h1>--%>
                <%--<h1 class="da-error-heading">${requestScope.url}</h1>--%>
                <center><a href="${pageContext.request.contextPath}/InitHomePage">
                    <h3>返回首页</h3>
                </a></center>

            </div>
        </div>
    </div>

    <%--<!-- Footer -->--%>
    <%--<div id="da-footer">--%>
        <%--<div class="da-container clearfix">--%>
            <%--<p> Copyright © 2018. All Rights Reserved. 青笺SEO | 桂ICP备17000628号</div>--%>
    <%--</div>--%>

</div>

</body>
</html>
