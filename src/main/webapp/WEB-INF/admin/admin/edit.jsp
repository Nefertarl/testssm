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

          <form action="${base}/admin/update" method="post" enctype="multipart/form-data" class="row">
            <input type="hidden" name="id" value="${a.id}" />
            <div class="form-group col-md-12">
              <label for="role">角色</label>
              <div class="form-group">
                <label class="col-xs-12" for="example-select">选择框</label>
                <div class="col-xs-12">
                  <select class="form-control" id="example-select" name="roleid" size="1">
                    <c:forEach var="r" items="${listRole}">
                      <option value="${r.id}" <c:if test="${a.roleid eq r.id}">selected</c:if> >${r.rolename}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
            </div>

            <div class="form-group col-md-12">
              <label for="name">用户名</label>
              <div class="form-controls">
                <input type="text" class="form-control" id="name" name="account" value="${a.account}" placeholder="请输入用户名"/>
              </div>
            </div>
            <div class="form-group col-md-12">
              <label for="title">姓名</label>
              <input type="text" class="form-control" id="title" name="name" value="${a.name}" placeholder="姓名"  />
            </div>
            <div class="form-group col-md-12">
              <label for="seo_keywords">密码</label>
              <input type="text" class="form-control" id="password" name="password" value="${a.password}" placeholder="密码"  />
            </div>
            <div class="form-group col-md-12">
              <label for="phone">手机</label>
              <input class="form-control" id="phone" name="phone" value="${a.phone}" placeholder="手机号"></input>
            </div>
            <div class="form-group col-md-12">
              <label for="email">邮箱</label>
              <input class="form-control" id="email" name="email"  value="${a.email}" placeholder="邮箱"></input>
            </div>
            <div class="form-group col-md-12">
              <label>头像</label>
              <div class="form-controls">

                <ul class="list-inline clearfix lyear-uploads-pic">
                  <li class="col-xs-4 col-sm-3 col-md-2">
                    <figure>
                      <img id="img" src="${base}/upload/${a.headPic}" alt="图片一">
                      <figcaption>
                        <a class="btn btn-round btn-square btn-primary" href="#!"><i class="mdi mdi-eye"></i></a>
                        <a class="btn btn-round btn-square btn-danger" href="#!"><i class="mdi mdi-delete"></i></a>
                      </figcaption>
                    </figure>
                  </li>
                  <li class="col-xs-4 col-sm-3 col-md-2">
                    <%--name名不能跟属性一样--%>
                    <input id="myHead" onchange="show(this)" type="file" style="display: none" name="myHead" />
                    <a class="pic-add" onclick="cli()" id="add-pic-btn" href="#!" title="点击上传"></a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="form-group col-md-12">
              <label for="sex">性别</label>
              <div class="clearfix">
                <label class="lyear-radio radio-inline radio-primary">
                  <input type="radio" name="sex" value="0" <c:if test="${a.sex eq 0}">checked</c:if>><span>女</span>
                </label>
                <label class="lyear-radio radio-inline radio-primary">
                  <input type="radio" name="sex" value="1" <c:if test="${a.sex eq 1}">checked</c:if> ><span>男</span>
                </label>
              </div>
            </div>

            <div class="form-group col-md-12">
              <label for="status">状态</label>
              <div class="clearfix">
                <label class="lyear-radio radio-inline radio-primary">
                  <input type="radio" name="status" value="0" <c:if test="${a.status eq 0}">checked</c:if>><span>未验证</span>
                </label>
                <label class="lyear-radio radio-inline radio-primary">
                  <input type="radio" name="status" value="1" <c:if test="${a.status eq 1}">checked</c:if> ><span>正常</span>
                </label>
                <label class="lyear-radio radio-inline radio-primary">
                  <input type="radio" name="status" value="2" <c:if test="${a.status eq 2}">checked</c:if> ><span>注销</span>
                </label>
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
<script>
    function cli() {
        //获取文件组件对象触发单击事件
        document.getElementById("myHead").click();
    }
    function show(obj) {
        var imgFile = obj.files[0];
        var src=window.URL.createObjectURL(imgFile);
        document.getElementById("img").setAttribute("src",src);
    }
</script>
</body>
</html>