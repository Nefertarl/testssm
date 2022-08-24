<%@ page contentType="text/html; charset=utf-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>登录页面 - 后台管理系统模板</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <meta name="keywords" content="LightYear">
    <meta name="description" content="LightYear">
    <meta name="author" content="yinqi">
    <link href="${base}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${base}/css/style.min.css" rel="stylesheet">
    <link href="${base}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${base}/css/animate.css" rel="stylesheet">
    <link href="${base}/css/style.min.css" rel="stylesheet">
    <style>
    .lyear-wrapper {
        position: relative;
    }
    .lyear-login {
        display: flex !important;
        min-height: 100vh;
        align-items: center !important;
        justify-content: center !important;
    }
    .login-center {
        background: #fff;
        min-width: 38.25rem;
        padding: 2.14286em 3.57143em;
        border-radius: 5px;
        margin: 2.85714em 0;
    }
    .login-header {
        margin-bottom: 1.5rem !important;
    }
    .login-center .has-feedback.feedback-left .form-control {
        padding-left: 38px;
        padding-right: 12px;
    }
    .login-center .has-feedback.feedback-left .form-control-feedback {
        left: 0;
        right: auto;
        width: 38px;
        height: 38px;
        line-height: 38px;
        z-index: 4;
        color: #dcdcdc;
    }
    .login-center .has-feedback.feedback-left.row .form-control-feedback {
        left: 15px;
    }
    </style>
</head>
  
<body>
<%--<div style="color: red">${error}</div>--%>
<div class="row lyear-wrapper">
  <div class="lyear-login">
    <div class="login-center">
      <div class="login-header text-center">
        <a href="javascript:void(0)"> </a>
      </div>
      <form action="${base}/admin/logins" method="post">
        <div class="form-group has-feedback feedback-left">
          <input type="text" placeholder="请输入您的用户名" class="form-control" name="account" id="username" />
          <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="form-group has-feedback feedback-left">
          <input type="password" placeholder="请输入密码" class="form-control" id="password" name="password" />
          <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
        </div>

        <div class="form-group has-feedback feedback-left row">
          <div class="col-xs-7">
            <input type="text" name="code" class="form-control" placeholder="验证码">
            <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
          </div>
          <div class="col-xs-5">
                                                                                                <%--
                                                                                                    单击一次,更新一张图片验证码,单击验证码图片,可能会单击多次,可能会出现缓存
                                                                                                    ,所以请求后面拼接随机数,是为了防止缓存(浏览器自带缓存)
                                                                                                   防止缓存,还可以拼接随机不重复的内容(时间戳\UUID)
                                                                                                --%>
            <img src="${base}/admin/getCode" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'?d='+Math.random();" title="点击刷新" alt="captcha">
          </div>

        </div>
        <div class="form-group">
          <button class="btn btn-block btn-primary" type="submit" >立即登录</button>
        </div>
      </form>
    </div>
  </div>
</div>
  <script type="text/javascript" src="${base}/js/jquery.min.js"></script>
  <script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
  <script type="text/javascript">;</script>
    <!--消息提示-->
    <script src="${base}/js/bootstrap-notify.min.js"></script>
    <script src="${base}/js/lightyear.js"></script>
    <script src="${base}/js/main.min.js"></script>

  <script type="text/javascript">
      if(${!empty error}){
          lightyear.loading('show');
          // 假设ajax提交操作
          setTimeout(function() {
              lightyear.loading('hide');
              lightyear.notify('${error}', 'danger', 100);
          }, 0)
      }
  </script>
</body>
</html>