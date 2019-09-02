<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/31
  Time: 16:30
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
    <script>
      $(function () {
          $("#logout").click(function () {
             var fromUrl= $(this).data("action");
             var state =false;
             if(confirm("您确定要退出吗？")){
                state = true;
             }

              return state;
          })
      })
    </script>
<div class="speedbar" style="height: auto">
    <!--登录-->
    <!--目前登录功能只有注册登录其它没必要没做-->
    <c:if test="${empty sessionScope.user}">
        <div class="pull-right">
            <i class="fa fa-power-off"></i>
            <a href="<%=basePath%>onclickLogin?next=${requestScope.fromUrl}">登录</a>&nbsp;&nbsp;&nbsp;
            <i class="fa fa-user"></i>
            <a href="<%=basePath%>onclickRegister?next=${requestScope.fromUrl}">注册</a>
        </div>
    </c:if>

    <c:if test="${!empty sessionScope.user}">
        <div class="pull-right">
            <i class="fa fa-user"></i>
            <a href="javascript:void(0)">${sessionScope.user.user_name}</a>&nbsp;&nbsp;&nbsp;
            <i class="fa fa-sign-out" aria-hidden="true"></i>
            <a id="logout" data-action="${requestScope.fromUrl}"  href="<%=basePath%>onLogout?next=${requestScope.fromUrl}">退出</a>
        </div>
    </c:if>

    <!--登录注册结束-->
    <!--公告-->
    <div class="toptip">
        <strong class="text-success"><i class="fa fa-volume-up"></i></strong> 功能完善中，敬请期待！！！
    </div>
    <!--公告结束-->
</div>
