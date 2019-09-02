<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/22
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML>
<header id="header" class="header">
    <!--个人博客logo块-->
    <div class="container-inner">
        <div class="yusi-logo">
            <a href="/">
                <h1>
                    <span class="yusi-mono">静觅</span>
                    <span class="yusi-bloger">DDS的个人博客</span>
                </h1>
            </a>
        </div>
    </div>

    <div id="nav-header" class="navbar">
        <ul class="nav">
            <li id="menu-item-44" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-44"><a href="${pageContext.request.contextPath}/InitHomePage">首页</a></li>
           <c:forEach items="${requestScope.categories}" var="category">
            <li id="menu-item-14" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children menu-item-14"><a href="${pageContext.request.contextPath}/Article_Category/${category.category_id}">${category.category_name}</a>
                <ul class="sub-menu">
                    <c:forEach items="${category.catalogues}" var="catalogue">
                    <li id="menu-item-19" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-19"><a href="${pageContext.request.contextPath}/Article_Catalogue/${catalogue.catalogue_id}">${catalogue.catalogue_name}</a></li>
                    </c:forEach>
                </ul>
            </li>
           </c:forEach>
            <li id="menu-item-14" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children menu-item-14"><a href="${pageContext.request.contextPath}/aboutMe">关于自己</a>
            <li id="menu-item-14" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children menu-item-14"><a href="${pageContext.request.contextPath}/messageForMe">给我留言</a>
            <!--搜索选项-->
            <%--<li style="float:right;">--%>
                <%--<div class="toggle-search">--%>
                    <%--<i class="fa fa-search"></i>--%>
                <%--</div>--%>
                <%--<div class="search-expand" style="display: none;">--%>
                    <%--<div class="search-expand-inner">--%>
                        <%--&lt;%&ndash;<form method="get" class="searchform themeform" onsubmit="location.href='https://cuiqingcai.com/?s=' + encodeURIComponent(this.s.value).replace(/%20/g, '+'); return false;" action="/">&ndash;%&gt;--%>
                        <%--<form method="get" class="searchform themeform" onsubmit="location.href='javascript:void(0)'" action="/">--%>
                            <%--<div>--%>
                                <%--<input type="ext" class="search" name="s" onblur="if(this.value=='')this.value='search...';" onfocus="if(this.value=='search...')this.value='';" value="search...">--%>
                            <%--</div>--%>
                        <%--</form>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</li>--%>
        </ul>
    </div>

    <!--这里删除了一个</div>-->
</header>
