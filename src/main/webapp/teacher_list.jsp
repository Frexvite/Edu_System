<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>教师管理</title>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<div class="container-fluid">
    <ul class="nav nav-tabs">
        <li class="active"><a href="TeacherServlet?action=list">教师列表</a></li>
        <c:if test="${loginUser.userType == '管理员'}"><li><a href="teacher_add.jsp">添加</a></li></c:if>
    </ul>
    <br/>
    <form class="form-inline" id="searchForm" action="TeacherServlet?action=list" method="post">
        <div class="form-group">
            <input type="text" class="form-control" name="keyword" id="keyword" placeholder="姓名">
            <input type="hidden" id="searchColumn" name="searchColumn" value="teacher_name"/>
        </div>
        <button class="btn btn-pill btn-danger btn-sm"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询
        </button>
    </form>
    <br/>
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <th>姓名</th>
            <th>性别</th>
            <th>学历</th>
            <th>职位</th>
            <th>院系</th>
            <th>联系电话</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="vo">
            <tr>
                <td><a href="TeacherServlet?action=get&id=${vo.id}">${vo.teacherName}</a></td>
                <td>${vo.teacherSex}</td>
                <td>${vo.teacherDegree}</td>
                <td>${vo.teacherPotition}</td>
                <td>${vo.teacherCollege}</td>
                <td>${vo.teacherPhone}</td>
                <td>
                    <button onclick="window.location.href='TeacherServlet?action=editPre&id=${vo.id}'"
                            class="btn btn-pill btn-danger btn-xs"
                            <c:if test="${loginUser.userType != '管理员'}">disabled="disabled" title="没有权限！！！"</c:if>
                             >
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        编辑
                    </button>
                    <button onclick="if(window.confirm('将要删除：${vo.teacherName}？'))window.location.href='TeacherServlet?action=delete&id=${vo.id}'"
                            class="btn btn-pill btn-primary btn-xs"
                            <c:if test="${loginUser.userType != '管理员'}">disabled="disabled" title="没有权限！！！"</c:if> >
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        删除
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="float: right;padding-right: 10px;color: #515151;"><jsp:include page="split.jsp"/></div>
</div>
</body>
</html>
