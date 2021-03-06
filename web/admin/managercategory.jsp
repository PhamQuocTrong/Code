

<%@page import="model.CategoryDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% CategoryDAO cateDAO = new CategoryDAO(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Danh Mục</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/admin/mos-css/mos-style1.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
<%
            if (session != null) {
                if (session.getAttribute("LOGIN") == null) {
                    response.sendRedirect("");
                }
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Quản Lý Danh Mục</h3>
                    <form action="ManagerCategoryServlet" method="POST">
                        <table style="
                               margin: auto;
                               ">
                            <tbody><tr>
                                    <td><b>ID:</b></td>
                                    <td><input type="text" class="sedang" readonly name="categoryid" value="${CATEGORY.categoryid}" ></td>
                                <td><b>Tên Danh Mục:</b></td>
                                <td><input type="text" placeholder="Nhập tên danh mục" class="sedang" name="categoryname" value="${CATEGORY.categoryname}" required></td>
                            </tr>
                            <tr><td></td>
                                <td>
                                    <input type="submit" class="button" name="action" value="Add New">
                                </td>
                                <td>
                                    <input type="submit" class="button" name="action" value="Update">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
                <table class="data">
                    <tbody><tr class="data">

                            <th class="data" width="30px">STT</th>
                            <th class="data">ID</th>
                            <th class="data">Tên Danh Mục</th>
                            <th class="data" width="75px">Chức Năng</th>
                        </tr>
                        <%
                            int count = 0;
                            for (int i = 0; i < cateDAO.getAlllist().size(); i++) {
                                Vector vt = (Vector) cateDAO.getAlllist().get(i);
                                count++;
                        %>
                        <tr class="data">
                            <td class="data" width="30px"><%=count%></td>
                            <td class="data"><%= vt.get(0)%></td>
                            <td class="data"><%= vt.get(1)%></td>
                            <td class="data" width="75px">
                    <center>
                        <a href='<%="ManagerCategoryServlet?action=edit&categoryid=" + vt.get(0)%>'>Sửa</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href='<%="ManagerCategoryServlet?action=del&categoryid=" + vt.get(0)%>'>Xóa</a>
                        <% }%>
                    </center>
                    </td>
                    </tr>

                    </tbody></table>
            </div>
            <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>

    </body>
</html>
