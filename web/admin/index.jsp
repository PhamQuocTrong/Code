

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/admin/mos-css/mos-style1.css" rel='stylesheet' type='text/css' />

    </head>
    <body>
        <%
            if (session != null) {
                if (session.getAttribute("LOGIN") == "OK") {
                    response.sendRedirect("admin.jsp");
                } else if (session.getAttribute("LOGIN") == "FAIL") {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Đăng Nhập Thất Bại');");
                    out.println("</script>");
                }
            }
        %>
        <div id="header">
            <div class="inHeaderLogin"></div>
        </div>
        <div id="loginForm">
            <div class="headLoginForm">
                Login Administrator
            </div>
            <div class="fieldLogin">
                <form method="get" action="LoginServlet">
                    <label>Username</label><br>
                    <input type="text" class="login" name="user"><br>
                    <label>Password</label><br>
                    <input type="password" class="login" name="pass"><br>
                    <input type="submit" class="button" value="Login">
                </form>
            </div>
        </div>

    </body>
</html>
