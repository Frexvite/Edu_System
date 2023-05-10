<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>课程添加</title>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<div class="container-fluid">
    <ul class="nav nav-tabs">
        <li><a href="CourseServlet?action=list">课程列表</a></li>
        <li class="active"><a href="#">添加</a></li>
    </ul>
    <br/>
    <form class="form-horizontal" role="form" action="CourseServlet?action=add" method="post" onsubmit="return check()">
        <div class="form-group">
            <label class="col-sm-3 control-label">课程名：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="courseName" name="courseName">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">开课时间：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="courseTime" name="courseTime">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">开课地址：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="courseRoom" name="courseRoom">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">学时：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="courseWeek" name="courseWeek">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">所属院系：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="courseCollege" name="courseCollege">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">学分：</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="courseScore" name="courseScore">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">备注：</label>
            <div class="col-sm-5">
                <textarea rows="3" class="form-control" id="courseText" name="courseText" placeholder="请输入内容......"></textarea>
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
        if (document.getElementById("courseName").value.trim().length == 0) {
            alert("课程名不能为空!");
            return false;
        }
        if (document.getElementById("courseTime").value.trim().length == 0) {
            alert("开课时间不能为空!");
            return false;
        }
        if (document.getElementById("courseRoom").value.trim().length == 0) {
            alert("开课地址不能为空!");
            return false;
        }
        if (document.getElementById("courseWeek").value.trim().length == 0) {
            alert("学时不能为空!");
            return false;
        }
        if (document.getElementById("courseCollege").value.trim().length == 0) {
            alert("所属院系不能为空!");
            return false;
        }
        if (document.getElementById("courseScore").value.trim().length == 0) {
            alert("学分不能为空!");
            return false;
        }
        return true;
    }
</script>
</html>
