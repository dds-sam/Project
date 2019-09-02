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
    <title>注册</title>
    <link rel="stylesheet" media="screen" href="<%=basePath%>static/css/dmaku.main.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="referrer" content="origin">
    <!-- 弹出层插件 -->
    <script type='text/javascript' src='<%=basePath%>static/js/jquery-1.8.3.js'></script>
    <script type='text/javascript' src='<%=basePath%>static/layer/layer.js'></script>
    <script type="text/javascript" src="<%=basePath%>static/js/jq_slideImage.js"></script>

    <script>
        // $(function () {
        $(document).ready(function() {
            var spanName=  $("#errors1");
            var spanPassword =$("#errors2");
            var spanemail = $("#emailerrors");
            var inputImage = $("#headImage");//用户头像输入框
            var spanheadImg = $("#headImg");//  <span id="headImg" style="color: red"></span>
            $("#registerSubmit").click(function () {
                var flag =true;
                var username = $("#user_name").val();
                var userpassword =$("#user_password").val();
                var useremail = $("#email").val();
                var headimages = inputImage.val();
                if(headimages.length == 0){
                   if(confirm("您确定不上传头像吗,使用系统默认的头像(丑丑的哦)？")){
                       flag = true;
                   }else{
                       spanheadImg.show();
                       spanheadImg.html("请上传头像！");
                       flag = false;
                   }
                }
                if(username.length == 0){
                    spanName.show();
                    spanName.html("用户名不能为空！");
                    flag =false;
                }
                if(userpassword.length == 0){
                    spanPassword.show();
                    spanPassword.html("密码不能为空！");
                    flag =false;
                }
                var checkemail =  checkUserEmail();//提交表单时再次校验邮箱是否正确
                if(checkemail == false){
                    flag =checkemail;
                }

                if(useremail.length == 0){
                    spanemail.show();
                    spanemail.html("邮箱不能为空！")
                    flag = false;
                }
                var  check =  checkName();//用户名是否被占用
                if(check == false){
                    flag = check;
                }
                var checkpassword = checkPassword();//两次密码是否一致
                if(checkpassword == false){
                    flag = checkpassword;
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
            //点击用户名输入框隐藏提示信息
            $("input[name=user_name]").focus(function () {
                spanName.hide();
            });
            $("input[name=user_password]").focus(function () {
                spanPassword.hide();
            });
            inputImage.focus(function () {
                spanheadImg.hide();
            });
            $("#confirm_user_password").focus(function () {
                $("#errors3").hide();
            });
            $("#email").focus(function () {
                spanemail.hide();
            });
            //检验用户名是否被占用
            checkName = function () {
                var username = $("#user_name").val();
                var state = true;
                $.ajax({
                    async:false,
                    url:"<%=basePath%>checkUserName",
                    type:"POST",
                    data:{"user_name":username},
                    success:function (data) {
                        // alert("ajax:"+data)
                        state = data;
                        if(state == false){
                            spanName.show();
                            spanName.html("用户名已存在！");
                        }
                    },
                    dataType:"json"
                });
                return state;
            };
            checkPassword = function () {
                var state = true;
                var confirm_user_password = $("#confirm_user_password").val();//获取确认密码输入框中的值
                var user_password = $("#user_password").val();//获取密码输入框中的值
                var spanconfirmPassword = $("#errors3");
                if(confirm_user_password !==user_password){
                    spanconfirmPassword.show();
                    spanconfirmPassword.html("两次密码不一致");
                    state = false;
                }
                return state;
            };
            checkUserEmail =function () {
                var state = true;
                var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
                var useremail = $("#email").val();
                if(!reg.test(useremail)){
                    spanemail.show();
                    spanemail.html("您输入的邮箱格式不正确，请重新输入！")
                    state = false;
                }
                return state;
            };

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
                    <h1 class="title">注册</h1>
                    <%--${pageContext.request.contextPath}/userRegister--%>
                    <form class="new_user_session" id="new_user_session" action="${pageContext.request.contextPath}/userRegister"  method="post"  enctype="multipart/form-data">
                        <input type="hidden" name="next" value="${requestScope.fromUrI}">
                        <div class="form-group">
                            <label for="user_name">头像</label>
                            <input id="headImage" class="form-control" type="file"  name="file" placeholder="请上传头像" />
                            <span id="headImg" style="color: red"></span>
                        </div>
                        <div class="form-group">
                            <label for="user_name">用户名</label>
                            <input class="form-control"placeholder="请输入用户名" type="text" value="" name="user_name" id="user_name" onblur="checkName()"/>
                            <span id="errors1" style="color: red"></span>
                        </div>
                        <div class="form-group">
                            <label for="user_password">密码</label>
                            <input autocomplete="off" class="form-control" placeholder="请输入密码" type="password" name="user_password" id="user_password" />
                            <span id="errors2" style="color: red"></span>
                        </div>
                        <div class="form-group">
                            <label for="user_password">确认密码</label>
                            <input autocomplete="off" class="form-control" placeholder="再次确认密码" type="password" name="user_password2" id="confirm_user_password" onblur="checkPassword()" />
                            <span id="errors3" style="color: red"></span>
                        </div>
                        <div class="form-group">
                            <label for="user_password">邮箱(email)</label>
                            <input autocomplete="off" class="form-control" placeholder="请输入您的邮箱" type="text" name="user_email" id="email" onblur="checkUserEmail()"/>
                            <span id="emailerrors" style="color: red"></span>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-6">
                                    <%--<input name="user[remember_me]" type="hidden" value="0" />   btn btn-default btn-success--%>
                                    <%--<input id="user_session_remember_me" type="checkbox" value="1" name="user[remember_me]" />--%>
                                    <%--<label for="user_session_remember_me" style="font-size:13px;font-weight:normal;">记住帐号</label>--%>
                                </div>
                                <div class="col-xs-12 col-sm-6 text-right">
                                    <%--<input class="btn btn-default btn-success" value="注册" type="submit" />--%>
                                    <button id="registerSubmit" class="btn btn-default btn-success">注册</button>
                                </div>
                            </div>
                        </div>

                    </form>
                    
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
