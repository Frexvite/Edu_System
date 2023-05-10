<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>课程管理</title>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<div class="container-fluid">
    <ul class="nav nav-tabs">
        <li class="active"><a href="CourseServlet?action=list">课程列表</a></li>
        <c:if test="${loginUser.userType == '管理员'}"><li><a href="course_add.jsp">添加</a></li></c:if>
    </ul>
    <br/>
    <form class="form-inline" id="searchForm" action="CourseServlet?action=list" method="post">
        <div class="form-group">
            <input type="text" class="form-control" name="keyword" id="keyword" placeholder="课程名">
            <input type="hidden" id="searchColumn" name="searchColumn" value="course_name"/>
        </div>
        <button class="btn btn-pill btn-danger btn-sm"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询
        </button>
    </form>
    <br/>
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <th>课程名</th>
            <th>开课时间</th>
            <th>开课地址</th>
            <th>学时</th>
            <th>所属院系</th>
            <th>学分</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="vo">
            <tr>
                <td><a href="CourseServlet?action=get&id=${vo.id}">${vo.courseName}</a></td>
                <td>${vo.courseTime}</td>
                <td>${vo.courseRoom}</td>
                <td>${vo.courseWeek}</td>
                <td>${vo.courseCollege}</td>
                <td>${vo.courseScore}</td>
                <td title="${vo.courseText}">
                <c:choose>
                    <c:when test="${fn:length(vo.courseText) > 19}">
                        <c:out value="${fn:substring(vo.courseText, 0, 19)}..."/>
                    </c:when>
                    <c:otherwise>
                        <c:out value="${vo.courseText}"/>
                    </c:otherwise>
                </c:choose>
                </td>
                <td>
                    <button onclick="window.location.href='CourseServlet?action=editPre&id=${vo.id}'"
                            class="btn btn-pill btn-danger btn-xs"
                            <c:if test="${loginUser.userType != '管理员'}">disabled="disabled" title="没有权限！！！"</c:if>
                             >
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        编辑
                    </button>
                    <button onclick="if(window.confirm('将要删除：${vo.courseName}？'))window.location.href='CourseServlet?action=delete&id=${vo.id}'"
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
