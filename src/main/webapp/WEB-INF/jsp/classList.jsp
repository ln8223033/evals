<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/1/18
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>班级列表</title>
</head>

<body>
<%--<form action="${pageContext.request.contextPath }/class/queryItems" method="post">--%>
    <td>
    <a href="${pageContext.request.contextPath }/class/insert"><input type="button" value="添加" /></a>
    </td>
    班级列表：
    <table width="100%" border=1>
        <tr>
            <td>班级名称</td>
            <td>年级</td>
            <td>学校Id</td>
            <td>学院</td>
            <td>专业</td>
        </tr>
        <c:forEach items="${classList}" var="item">
            <tr>
                <td>${item.name }</td>
                <td>${item.grade }</td>
                <td>${item.schoolid }</td>
                <td>${item.departmentid }</td>
                <td>${item.professionid }</td>

            </tr>
        </c:forEach>
    </table>
    </table>

    首页  ${page.firstPage}
    上一页${page.prePage}
    下一页 ${page.nextPage}
    尾页 ${page.lastPage}
    第${page.pageNum}页/共${page.pages}页
<%--</form>--%>
</body>
</html>