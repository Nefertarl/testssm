<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <title>文档列表 </title>
  <link rel="icon" href="../favicon.ico" type="image/ico">
  <meta name="keywords" content="LightYear">
  <meta name="description" content="LightYear">
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
          <form class="pull-right search-bar" method="get" action="${base}/role/show" role="form" id="mySearchForm">
            <div class="input-group">
              <div class="input-group-btn">
                <input type="hidden" name="search_field" id="search-field" value="title">
                <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                  search <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name" onclick="changeSearch('rolename')" >角色名称</a> </li>
                </ul>
              </div>
              <input type="text" class="form-control" value="" id="search" onblur="doSearch()" name="rolename" placeholder="请输入名称">
            </div>
          </form>
          <form id="myForm" action="" method="post">
            <div class="toolbar-btn-action">
              <a class="btn btn-primary m-r-5" href="${base}/role/toAdd"><i class="mdi mdi-plus"></i> 新增</a>
              <a class="btn btn-danger" href="#!" onclick="BathDelBtn()"><i class="mdi mdi-window-close"></i> 全部删除</a>
            </div>
          </form>
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
                <th>角色名称</th>
                <th>所属用户</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>

              <c:forEach var="a" items="${p.list}">
                <tr>
                  <td>
                    <label class="lyear-checkbox checkbox-primary">
                      <input type="checkbox" name="ids[]" value="${a.id}"><span></span>
                    </label>
                  </td>
                  <td>${a.id}</td>
                  <td>${a.rolename}</td>
                  <td>
                    <select>
                      <c:forEach var="r" items="${a.adminList}">
                        <option value="${r.id}">${r.name}</option>
                      </c:forEach>
                    </select>
                  </td>
                  <td>
                    <div class="btn-group">
                      <a class="btn btn-xs btn-default" href="${base}/role/doDelRole?id=${a.id}" onclick="return confirm('是否删除')" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
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
  function changeSearch(obj){
    document.getElementById("search").setAttribute("name",obj);
  }

  //
  function doSearch(){
    var mySearchForm = document.getElementById("mySearchForm");
    mySearchForm.submit();
  }


  //批量删除按钮
  function BathDelBtn(){
    var myForm = document.getElementById("myForm");
    //获取选中的id值
    var value = cliBtn();
    myForm.action="${base}/role/doBathDelRole?ids="+value;
    if (chenNum()) {
      myForm.submit();
    }
  }

  //获取选中的id值
  function cliBtn(){
    var cks = document.getElementsByName("ids[]");
    var str="";
    for(var i=0;i<cks.length;i++){
      if (cks[i].checked) {
        str+=cks[i].value+",";
      }
    }
    str = str.substring(0,str.length-1);
    var result = str.split(",");
    return result;
  }

  //查看复选框是否被选中
  function chenNum(){
    var cks = document.getElementsByName("ids[]");
    for(var i=0;i<cks.length;i++){
      if (cks[i].checked) {
        return true;
      }
    }
    return false;
  }


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