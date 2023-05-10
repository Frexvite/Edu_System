<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>公告管理</title>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<div class="container-fluid">
    <ul class="nav nav-tabs">
        <li class="active"><a href="NoticeServlet?action=list">公告列表</a></li>
        <c:if test="${loginUser.userType == '管理员'}"><li><a href="notice_add.jsp">添加</a></li></c:if>
    </ul>
    <br/>
    <form class="form-inline" id="searchForm" action="NoticeServlet?action=list" method="post">
        <div class="form-group">
            <input type="text" class="form-control" name="keyword" id="keyword" placeholder="标题">
            <input type="hidden" id="searchColumn" name="searchColumn" value="notice_name"/>
        </div>
        <button class="btn btn-pill btn-danger btn-sm"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询
        </button>
    </form>
    <br/>
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <th>标题</th>
            <th>内容</th>
            <th>类型</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="vo">
            <tr>
                <td><a href="NoticeServlet?action=get&id=${vo.id}">${vo.noticeName}</a></td>
                <td title="${vo.noticeText}">
                <c:choose>
                    <c:when test="${fn:length(vo.noticeText) > 19}">
                        <c:out value="${fn:substring(vo.noticeText, 0, 19)}..."/>
                    </c:when>
                    <c:otherwise>
                        <c:out value="${vo.noticeText}"/>
                    </c:otherwise>
                </c:choose>
                </td>
                <td>${vo.noticeType}</td>
                <td>${vo.createDate}</td>
                <td>
                    <button onclick="window.location.href='NoticeServlet?action=editPre&id=${vo.id}'"
                            class="btn btn-pill btn-danger btn-xs"
                            <c:if test="${loginUser.userType != '管理员'}">disabled="disabled" title="没有权限！！！"</c:if>
                             >
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        编辑
                    </button>
                    <button onclick="if(window.confirm('将要删除：${vo.noticeName}？'))window.location.href='NoticeServlet?action=delete&id=${vo.id}'"
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
