<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>文档列表 - 光年(Light Year Admin)后台管理系统模板</title>
<link rel="icon" href="../favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/materialdesignicons.min.css" rel="stylesheet">
<link href="../css/style.min.css" rel="stylesheet">
</head>
  
<body>
<div class="container-fluid">

  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-toolbar clearfix">
          <div class="toolbar-btn-action">
            <a class="btn btn-primary m-r-5" href="add.html"><i class="mdi mdi-plus"></i> 新增</a>
            <a class="btn btn-success m-r-5" href="#!"><i class="mdi mdi-check"></i> 启用</a>
            <a class="btn btn-warning m-r-5" href="#!"><i class="mdi mdi-block-helper"></i> 禁用</a>
            <a class="btn btn-danger" href="#!"><i class="mdi mdi-window-close"></i> 删除</a>
          </div>
        </div>
        <div class="card-body">

          <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
                  <tr>
                    <th>
                      <label class="lyear-checkbox checkbox-primary">
                        <input type="checkbox" id="check-all"><span></span>
                      </label>
                    </th>
                    <th>编号</th>
                    <th>角色名</th>
                    <th>创建人</th>
                    <th>简介</th>
                    <th>状态</th>
                    <th>操作</th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach var="r"  items="${p.list}">
                <tr>
                  <td>
                    <label class="lyear-checkbox checkbox-primary">
                      <input type="checkbox" name="ids[]" value="1"><span></span>
                    </label>
                  </td>
                  <td>${r.id}</td>
                  <td>${r.rolename}</td>
                  <td>${r.operator}</td>
                  <td>${r.overview}</td>
                  <td><c:if test="${r.status eq 1}"><font class="text-success">正常</font></c:if></td>
                  <td><c:if test="${r.status eq 0}"><font class="text-success">注销</font></c:if></td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-xs btn-default" href="#!" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
                      <a class="btn btn-xs btn-default" href="#!" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
                      <a class="btn btn-xs btn-default" href="${base}/role/allMenu?id=${r.id}" title="分配权限" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
                    </div>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
          <ul class="pagination">
            <li><span><a href="${base}/role/show?pageNum=${p.prePage}">«</a></span></li>
            <c:forEach var="i" items="${p.navigatepageNums}">
              <li <c:if test="${i eq p.pageNum}"> class="active" </c:if> ><a href="${base}/role/show?pageNum=${i}">${i}</a></li>
            </c:forEach>
            <li><span><a href="${base}/role/show?pageNum=${p.nextPage}">»</a></span></li>
          </ul>

        </div>
      </div>
    </div>

  </div>

</div>

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../js/main.min.js"></script>
<script type="text/javascript">
$(function(){
    $('.search-bar .dropdown-menu a').click(function() {
        var field = $(this).data('field') || '';
        $('#search-field').val(field);
        $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
    });
});
</script>
</body>
</html>