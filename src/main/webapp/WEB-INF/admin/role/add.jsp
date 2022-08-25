<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>新增文档 - 光年(Light Year Admin)后台管理系统模板</title>
<link rel="icon" href="../favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/materialdesignicons.min.css" rel="stylesheet">
<!--标签插件-->
<link rel="stylesheet" href="../js/jquery-tags-input/jquery.tagsinput.min.css">
<link href="../css/style.min.css" rel="stylesheet">
</head>

<body>
<div class="container-fluid">

  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body">

          <form action="${base}/role/doAdd" onsubmit="return checkForm()" method="post" enctype="multipart/form-data" class="row">
            <div class="form-group col-md-12">
              <label for="name">角色名称</label>
              <div class="form-controls">
                <input type="text" class="form-control" id="rolename" name="rolename" value="" placeholder="请输入角色名称" onblur="checkAccount()"/>
              </div>
            </div>


            <div class="form-group col-md-12">
              <button type="submit" class="btn btn-primary ajax-post" target-form="add-form">确 定</button>
              <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
            </div>
          </form>

        </div>
      </div>
    </div>

  </div>

</div>

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/perfect-scrollbar.min.js"></script>
<!--标签插件-->
<script src="../js/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="../js/main.min.js"></script>

<!--消息提示-->
<script src="${base}/js/bootstrap-notify.min.js"></script>
<script src="${base}/js/lightyear.js"></script>
<script src="${base}/js/main.min.js"></script>
<link href="${base}/css/animate.css" rel="stylesheet">
<script>
  var flag = true;
  //验证表单-----------------------
  function checkForm(){
    //验证账号
    var rolename = document.getElementById("rolename").value;
    if (rolename=="" || rolename==null) {
      lightyear.loading('show');
      // 假设ajax提交操作
      setTimeout(function() {
        lightyear.loading('hide');
        lightyear.notify('角色名称不能为空', 'danger', 100);
      }, 1e3)
      return false;
    }
    if(!flag){
      lightyear.loading('show');
      // 假设ajax提交操作
      setTimeout(function() {
        lightyear.loading('hide');
        lightyear.notify('角色已存在!', 'danger', 100);
      }, 1e3)
      return false;
    }

    return true;
  }

  //验证角色名称是否可用
  function checkAccount(){
    var rolename = document.getElementById("rolename").value;
    $.post('${base}/role/checkRolename?rolename='+rolename,function (result) {
      if (result=="角色没重复"){
        lightyear.loading('show');
        // 假设ajax提交操作
        setTimeout(function() {
          lightyear.loading('hide');
          lightyear.notify('角色没重复', 'success', 100);
        }, 1e3)
        flag = true;
      }else {
        lightyear.loading('show');
        // 假设ajax提交操作
        setTimeout(function() {
          lightyear.loading('hide');
          lightyear.notify('角色不可用!', 'danger', 100);
        }, 1e3)
        flag = false;
      }
    });
  }

</script>
</body>
</html>