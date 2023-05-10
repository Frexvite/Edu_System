<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>学生管理</title>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<div class="container-fluid">
    <ul class="nav nav-tabs">
        <li class="active"><a href="StudentServlet?action=list">学生列表</a></li>
        <c:if test="${loginUser.userType == '管理员'}"><li><a href="student_add.jsp">添加</a></li></c:if>
    </ul>
    <br/>
    <form class="form-inline" id="searchForm" action="StudentServlet?action=list" method="post">
        <div class="form-group">
            <input type="text" class="form-control" name="keyword" id="keyword" placeholder="姓名">
            <input type="hidden" id="searchColumn" name="searchColumn" value="student_name"/>
        </div>
        <button class="btn btn-pill btn-danger btn-sm"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询
        </button>
    </form>
    <br/>
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>学号</th>
            <th>班级</th>
            <th>联系电话</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="vo">
            <tr>
                <td><a href="StudentServlet?action=get&id=${vo.id}">${vo.studentName}</a></td>
                <td>${vo.studentAge}</td>
                <td>${vo.studentSex}</td>
                <td>${vo.studentNumber}</td>
                <td>${vo.studentClass}</td>
                <td>${vo.studentPhone}</td>
                <td title="${vo.studentText}">
                <c:choose>
                    <c:when test="${fn:length(vo.studentText) > 19}">
                        <c:out value="${fn:substring(vo.studentText, 0, 19)}..."/>
                    </c:when>
                    <c:otherwise>
                        <c:out value="${vo.studentText}"/>
                    </c:otherwise>
                </c:choose>
                </td>
                <td>
                    <button onclick="window.location.href='StudentServlet?action=editPre&id=${vo.id}'"
                            class="btn btn-pill btn-danger btn-xs"
                            <c:if test="${loginUser.userType != '管理员'}">disabled="disabled" title="没有权限！！！"</c:if>
                             >
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        编辑
                    </button>
                    <button onclick="if(window.confirm('将要删除：${vo.studentName}？'))window.location.href='StudentServlet?action=delete&id=${vo.id}'"
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
