<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>学生详情</title>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<div class="container-fluid">
    <ul class="nav nav-tabs">
        <li><a href="StudentServlet?action=list">用户列表</a></li>
        <li class="active"><a href="#">详情</a></li>
    </ul>
    <br/>
    <form class="form-horizontal" role="form" action="#" method="post">
        <input type="hidden" class="form-control" id="id" name="id" value="${vo.id}"/>
        <div class="form-group">
            <label class="col-sm-3 control-label">姓名：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.studentName}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">年龄：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.studentAge}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">性别：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.studentSex}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">学号：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.studentNumber}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">班级：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.studentClass}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">联系电话：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                ${vo.studentPhone}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">备注：</label>
            <div class="col-sm-5" style="padding-top: 7px;">
                <textarea rows="3" class="form-control" id="studentText" name="studentText" disabled="disabled">${vo.studentText}</textarea>
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
