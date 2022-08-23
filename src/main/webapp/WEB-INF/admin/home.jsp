<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>首页 </title>
    <link rel="icon" href="./favicon.ico" type="image/ico">
    <meta name="keywords" content="LightYear">
    <meta name="description" content="LightYear">
    <meta name="author" content="yinqi">
    <link href="${base}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${base}/css/style.min.css" rel="stylesheet">
</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">

      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
      </div>
      <div class="lyear-layout-sidebar-scroll">
        <!--功能菜单栏开始 每个ul为一个答菜单-->
        <nav class="sidebar-main">
          <ul class="nav nav-drawer">
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)" _href="${base}/admin/toList"><i class="mdi mdi-palette"></i> 用户管理</a>
            </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)" _href="${base}/role/toList"><i class="mdi mdi-palette"></i> 角色管理</a>
            </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)" _href="${base}/relation/toList"><i class="mdi mdi-palette"></i> 用户-角色管理</a>
            </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="${base}/admin/logout" target="_top"><i class="mdi mdi-palette"></i> 退出登录</a>
            </li>
          </ul>
        </nav>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <!--头部信息-->
    <header class="lyear-layout-header">
      
      <nav class="navbar navbar-default">
        <div class="topbar">
          
          <div class="topbar-left">
            <div class="lyear-aside-toggler">
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
            </div>
            <span class="navbar-page-title"> 向左收起 </span>
          </div>
          
        </div>
      </nav>
      
    </header>
    <!--End 头部信息-->
    
    <!--页面主要内容-->
    <main class="lyear-layout-content">
      <iframe src="${base}/toIndex" id="main" frameborder="0" style="width: 100%;" ></iframe>
    </main>
    <!--End 页面主要内容-->
  </div>
</div>

<script type="text/javascript" src="${base}/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/js/main.min.js"></script>
<!--iframe自适应高度-->
<script>

    // var uls=document.getElementsByTagName("ul");
    // for(var i=0;i<uls.length;i++){
    //     var v=uls[i].innerText;
    //     if(v.trim()==="") $(uls[i]).removeClass("nav-subnav");
    // }

    /*a标签点击跳转*/
    $("a").click(function () {
        var href = $(this).attr("_href");
        if(href!=null&&href!=""){
            $("#main").attr("src",href);
        }
    });

    var iframe = document.getElementById("main");

    function getClientHeight()
    {
        var clientHeight=0;
        if(document.body.clientHeight&&document.documentElement.clientHeight)
        {
            var clientHeight = (document.body.clientHeight<document.documentElement.clientHeight)?document.body.clientHeight:document.documentElement.clientHeight;
        }
        else
        {
            var clientHeight = (document.body.clientHeight>document.documentElement.clientHeight)?document.body.clientHeight:document.documentElement.clientHeight;
        }
        return clientHeight;
    }
    iframe.setAttribute("height",getClientHeight()-75);
</script>
</body>
</html>