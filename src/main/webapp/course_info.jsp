<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>课程详情</title>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<div class="container-fluid">
    <ul class="nav nav-tabs">
        <li><a href="CourseServlet?action=list">用户列表</a></li>
        <li class="active"><a href="#">详情</a></li>
    </ul>
    <br/>
    <form class="form-horizontal" role="form" action="#" method="post">
        <input type="hidden" class="form-control" id="id" name="id" value="${vo.id}"/>
        <div class="form-group">
            <label class="col-sm-3 control-label">课程名：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.courseName}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">开课时间：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.courseTime}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">开课地址：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.courseRoom}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">学时：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.courseWeek}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">所属院系：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.courseCollege}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">学分：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.courseScore}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">备注：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                <textarea rows="3" class="form-control" id="courseText" name="courseText" disabled="disabled">${vo.courseText}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label"></label>
            <div class="col-sm-5" style="padding-top: 7px;">
                <input type="button" class="btn btn-pill btn-primary btn-sm" value="返回" onclick="javascript:history.back(-1);">
            </div>
        </div>
    </form>
</div>
</body>
</html>
