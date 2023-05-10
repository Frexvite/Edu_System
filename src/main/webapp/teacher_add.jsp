<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>教师添加</title>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<div class="container-fluid">
    <ul class="nav nav-tabs">
        <li><a href="TeacherServlet?action=list">教师列表</a></li>
        <li class="active"><a href="#">添加</a></li>
    </ul>
    <br/>
    <form class="form-horizontal" role="form" action="TeacherServlet?action=add" method="post" onsubmit="return check()">
        <div class="form-group">
            <label class="col-sm-3 control-label">姓名：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="teacherName" name="teacherName">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">性别：</label>
            <div class="col-sm-5">
                <input name="teacherSex" type="radio" value="男" checked="checked"/>&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="teacherSex" type="radio" value="女"/>&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">学历：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="teacherDegree" name="teacherDegree">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">职位：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="teacherPotition" name="teacherPotition">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">院系：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="teacherCollege" name="teacherCollege">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">联系电话：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="teacherPhone" name="teacherPhone">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label"></label>
            <div class="col-sm-5">
                <input type="submit" class="btn btn-pill btn-warning btn-sm" value="保存">
                <input type="button" class="btn btn-pill btn-primary btn-sm" value="返回" onclick="javascript:history.back(-1);">
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript">
    //提交之前进行检查，如果return false，则不允许提交
    function check() {
        //根据ID获取值
        if (document.getElementById("teacherName").value.trim().length == 0) {
            alert("姓名不能为空!");
            return false;
        }
        if (document.getElementById("teacherDegree").value.trim().length == 0) {
            alert("学历不能为空!");
            return false;
        }
        if (document.getElementById("teacherPotition").value.trim().length == 0) {
            alert("职位不能为空!");
            return false;
        }
        if (document.getElementById("teacherCollege").value.trim().length == 0) {
            alert("院系不能为空!");
            return false;
        }
        if (document.getElementById("teacherPhone").value.trim().length == 0) {
            alert("联系电话不能为空!");
            return false;
        }
        return true;
    }
</script>
</html>
