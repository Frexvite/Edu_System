<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>学生编辑</title>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<div class="container-fluid">
    <ul class="nav nav-tabs">
        <li><a href="StudentServlet?action=list">学生列表</a></li>
        <li class="active"><a href="#">编辑</a></li>
    </ul>
    <br/>
    <form class="form-horizontal" role="form" action="StudentServlet?action=edit" method="post" onsubmit="return check()">
        <input type="hidden" class="form-control" id="id" name="id" value="${vo.id}"/>
        
            <div class="form-group">
                <label class="col-sm-3 control-label">姓名：</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="studentName" name="studentName" value="${vo.studentName}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">年龄：</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="studentAge" name="studentAge" value="${vo.studentAge}">
                </div>
            </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">性别：</label>
            <div class="col-sm-5">
                       <input name="studentSex" type="radio" value="男" ${vo.studentSex=='男'?'checked':''}/>&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;
                       <input name="studentSex" type="radio" value="女" ${vo.studentSex=='女'?'checked':''}/>&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">学号：</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="studentNumber" name="studentNumber" value="${vo.studentNumber}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">班级：</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="studentClass" name="studentClass" value="${vo.studentClass}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">联系电话：</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="studentPhone" name="studentPhone" value="${vo.studentPhone}">
                </div>
            </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">备注：</label>
            <div class="col-sm-5">
                <textarea rows="3" class="form-control" id="studentText" name="studentText" placeholder="请输入内容......">${vo.studentText}</textarea>
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
        if (document.getElementById("studentName").value.trim().length == 0) {
            alert("姓名不能为空!");
            return false;
        }
        if (document.getElementById("studentAge").value.trim().length == 0) {
            alert("年龄不能为空!");
            return false;
        }
        if (document.getElementById("studentNumber").value.trim().length == 0) {
            alert("学号不能为空!");
            return false;
        }
        if (document.getElementById("studentClass").value.trim().length == 0) {
            alert("班级不能为空!");
            return false;
        }
        if (document.getElementById("studentPhone").value.trim().length == 0) {
            alert("联系电话不能为空!");
            return false;
        }
        return true;
    }
</script>
</html>
