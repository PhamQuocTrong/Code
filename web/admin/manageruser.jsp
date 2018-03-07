

<%@page import="java.util.Vector"%>
<%@page import="model.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% UserDAO userDAO = new UserDAO(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Khách Hàng</title>
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
                    <h3>Quản Lý Người Dùng</h3>
                    <form action="ManagerUserServlet" method="POST">
                        <table style="
                               margin: auto;
                               ">
                            <tbody><tr>
                                    <td><b>ID:</b></td>
                                    <td><input type="text" class="sedang" readonly name="id" value="${USER.id}" ></td>
                                    <td><b>UserName:</b></td>
                                    <td><input type="text" placeholder="Nhập tên đăng nhập" class="sedang" name="username" value="${USER.userName}" required></td>
                                </tr>
                                <tr>
                                    <td><b>Email:</b></td>
                                    <td><input type="email" placeholder="Nhập email" class="sedang" name="email" required value="${USER.userEmail}"></td>
                                    <td><b>PassWord:</b></td>
                                    <td><input type="text" placeholder="Nhập mật khẩu" class="sedang" name="pass" required value="${USER.userPass}"></td>
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
                                <th class="data">Tài Khoản</th>
                                <th class="data">Email</th>
                                <th class="data">Mật Khẩu</th>
                                <th class="data" width="75px">Chức Năng</th>
                            </tr>
                        <%
                            int count = 0;
                            for (int i = 0; i < userDAO.getAlllist().size(); i++) {
                                Vector vt = (Vector) userDAO.getAlllist().get(i);
                                count++;
                        %>
                        <tr class="data">
                            <td class="data" width="30px"><%=count%></td>
                            <td class="data"><%= vt.get(0)%></td>
                            <td class="data"><%= vt.get(1)%></td>
                            <td class="data"><%= vt.get(2)%></td>
                            <td class="data"><%= vt.get(3)%></td>
                            <td class="data" width="75px">
                    <center>
                        <a href='<%="ManagerUserServlet?action=edit&id=" + vt.get(0)%>'>Sửa</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href='<%="ManagerUserServlet?action=del&id=" + vt.get(0)%>'>Xóa</a>
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
