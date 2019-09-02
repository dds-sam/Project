<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>登录DDS的个人博客</title>
		<link rel="stylesheet" media="screen" href="<%=basePath%>static/css/dmaku.main.css" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="referrer" content="origin">
        <script type='text/javascript' src='<%=basePath%>static/js/jquery-1.8.3.js'></script>
		<script type='text/javascript' src='<%=basePath%>static/layer/layer.js'></script>
		<script type="text/javascript" src="<%=basePath%>static/js/jq_slideImage.js"></script>
        <script>
			$(function () {
                var span1=  $("#errors1");
                var span2 =$("#errors2");
                $("#registerSubmit").click(function () {
					var flag =true;
					var username = $("#user_name").val();
					var userpassword =$("#user_password").val();
				    if(username.length == 0){
                       span1.show();
                       span1.html("用户名不能为空！");
                       flag =false;
				    }
				    if(userpassword.length == 0){
				        span2.show();
                        span2.html("密码不能为空！");
                       flag =false;
				    }
                    if(flag == true){
                        flag = false;
                        layer.open({
                            type: 1,
                            closeBtn: 0,
                            shadeClose: false, //点击遮罩关闭
                            content:$("#slideImages"),
                            success:function () {
                                $(".layui-layer-title").hide();
                                var mySlideImage = new SlideImageVerify('#slideImages',{
                                    initText:'请滑动拼图完成验证',
                                    slideImage:['static/images/slideImages/a1.jpg','static/images/slideImages/a2.jpg','static/images/slideImages/a3.jpg'],
                                    slideAreaNum:10,
                                    refreshSlide:true,
                                    getSuccessState:function (res) {
                                        $("form").submit();//图片验证成功，提交表单

                                    }
                                });
                            }
                        });
                    }
				    return flag;
                });
				$("input[name=user_name]").focus(function () {
                    span1.hide();
                });
                $("input[name=user_password]").focus(function () {
                    span2.hide();
                })
            })
        </script>
	</head>

	<body>
		<div class="wrapper">
			<div class="top_wrapper">
				<div class="container">
					<div class="col-sm-12 header"><img src="<%=basePath%>static/images/login_logo.png" width="140" height="37" class="retina" /></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-sm-12 login_content_wrapper">
						<div class="content_wrapper">
							<div id="messages" class="alert alert-danger">
								<p>${requestScope.errorMessage == null?"":requestScope.errorMessage}</p>
							</div>
							<h1 class="title">登录到DDS的个人博客</h1>
							<form class="new_user_session" id="new_user_session" action="${pageContext.request.contextPath}/userLogin"  method="post">
								<input type="hidden" name="next" value="${requestScope.fromUrI}">
								<div class="form-group">
									<label for="user_name">用户名</label>
									<input class="form-control" type="text" value="" name="user_name" id="user_name" />
									<span id="errors1" style="color: red"></span>
								</div>
								<div class="form-group">
									<label for="user_password">密码</label>
									<input autocomplete="off" class="form-control" type="password" name="user_password" id="user_password" />
									<span id="errors2" style="color: red"></span>
								</div>

								<div class="form-group">
									<div class="row">
										<div class="col-sm-6">
											<input name="user[remember_me]" type="hidden" value="0" />
											<input id="user_session_remember_me" type="checkbox" value="1" name="user[remember_me]" />
											<label for="user_session_remember_me" style="font-size:13px;font-weight:normal;">记住帐号</label>
										</div>
										<div class="col-xs-12 col-sm-6 text-right">
											<%--<input class="btn btn-default btn-success" value="登 入" type="submit" />--%>
											<button id="registerSubmit" class="btn btn-default btn-success">登录</button>
										</div>
									</div>
								</div>

							</form>
                            <div class="from-group">
                                <div class="row forgot_password">
                                    <div class="col-sm-12">
                                        <a href="">忘记密码?</a><a style="float:right;" href="<%=basePath%>onclickRegisterNew?next=${requestScope.fromUrI}">注册新帐号</a>
                                    </div>
                                </div>
                            </div>
						</div>
					</div>
				</div>
			</div>
			<style>
				.demo1{
					width: 300px;
					height: 200px;
				}

			</style>

			<div class="demo1" id="slideImages">

			</div>
		</div>
	</body>
</html>
