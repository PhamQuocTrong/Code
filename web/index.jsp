<%-- 
    Document   : index
    Created on : Oct 1, 2017, 1:34:50 AM
    Author     : kuminhdey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <title>Đà Nẵng Cosmetic</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/ihover.css">
        <script type="text/javascript" src="js/javascript.js"></script>
    </head>
    <body>
        <%
            if (session != null) {
                if (session.getAttribute("DANGKY") == "OK") {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Đăng Ký Thành Công');");
                    out.println("</script>");
                    session.invalidate();
                } else if (session.getAttribute("DANGKY") == "FAIL") {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Đăng Ký Thất Bại');");
                    out.println("</script>");
                    session.invalidate();
                }
            }
        %>
        <jsp:include page="/header.jsp"></jsp:include>
        <jsp:include page="/slider.jsp"></jsp:include>
        <jsp:include page="/content.jsp"></jsp:include>
        <jsp:include page="/footer.jsp"></jsp:include>
    </body>
</html>
