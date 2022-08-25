<%@page contentType="text/html; charset=utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>设置权限 - 光年(Light Year Admin)后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="${base}/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="${base}/admin/css/materialdesignicons.min.css" rel="stylesheet">
<link href="${base}/admin/css/style.min.css" rel="stylesheet">
</head>
  
<body>

  <div class="container-fluid">

    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-header"><h4>分配角色</h4></div>
          <div class="card-header"><h4>用户名称:${as.name}</h4></div>
          <div class="card-body">


            <form action="${base}/admin/doAddRes" method="post">


              <div class="form-group">
                <input type="hidden" name="uid" value="${as.id}">
              </div>

              <div class="form-group">
                <c:forEach var="r" items="${rs}">
                  <input type="checkbox" name="rid" value="${r.id}"><span>${r.rolename}</span>
                </c:forEach>
              </div>

              <div class="table-responsive">
                <div class="form-group col-md-12">
                  <button type="submit" class="btn btn-primary ajax-post" target-form="add-form">确 定</button>
                  <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                </div>
            </div>
            </form>

          </div>
        </div>
      </div>

    </div>

  </div>

<script type="text/javascript" src="${base}/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/admin/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/admin/js/main.min.js"></script>

<script type="text/javascript" src="${base}/admin/js/chosen.jquery.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>