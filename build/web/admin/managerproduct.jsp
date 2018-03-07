

<%@page import="model.CategoryDAO"%>
<%@page import="model.CategoryDAO"%>
<%@page import="model.ProductDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ProductDAO proDAO = new ProductDAO(); %>
<% CategoryDAO cateDAO = new CategoryDAO();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Sản Phẩm</title>
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
                    <h3>Quản Lý Sản Phẩm</h3>
                    <form action="ManagerProductServlet" method="get">
                        <table style="
                               margin: auto;
                               ">
                            <tbody>
                                <tr>
                                    <td><b>ID:</b></td>
                                    <td><input type="text" class="sedang" readonly name="productid" value="${PRODUCT.productid}" ></td>
                                <td><b>Tên Danh Mục:</b></td>
                                <td><select name="category">
                                        <c:forEach items="${CATEGORYNAME}" var="danhmuc">
                            <option value="${danhmuc.categoryid}" ${danhmuc.categoryid == PRODUCT.category.categoryid ? 'selected="selected"' : ''} >${danhmuc.categoryname}</option>
                        </c:forEach>
                                    </select></td>
                                   
                            </tr>
                            <tr>
                                <td><b>Tên Sản Phẩm:</b></td>
                                <td><input type="text" placeholder="Nhập tên sản phẩm" class="sedang" name="productname" value="${PRODUCT.productname}" required></td>
                                <td><b>Giá Sản Phẩm:</b></td>
                                <td><input type="number" placeholder="Nhập giá sản phẩm" class="sedang" name="productprice" value="${PRODUCT.productprice}" required></td>
                            </tr>
                            <tr><td><b>Hình sản phẩm:</b></td>
                                <td><input type="text" placeholder="Url sản phẩm" name="productimage" value="${PRODUCT.productimage}" ></td>
                                <td><b>Chi tiết sản phẩm:</b></td>
                                <td><input type="text" placeholder="Nhập chi tiết sản phẩm" name="productdetail" value="${PRODUCT.productdetail}" ></td>
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
                            <th class="data">Tên Sản Phẩm</th>
                            <th class="data">Giá Sản Phẩm</th>
                            <th class="data">Hình Sản Phẩm</th>
                            <th class="data">Chi Tiết</th>
                            <th class="data" width="75px">Chức Năng</th>
                        </tr>
                        <%
                            int count = 0;
                            for (int i = 0; i < proDAO.getAlllist().size(); i++) {
                                Vector vt = (Vector) proDAO.getAlllist().get(i);
                                count++;
                        %>
                        <tr class="data">
                            <td class="data" width="30px"><%=count%></td>
                            <td class="data"><%= vt.get(0)%></td>                          
                            <td class="data"><%= vt.get(7)%></td>
                            <td class="data"><%= vt.get(2)%></td>
                            <td class="data"><%= vt.get(3)%></td>
                            <td class="data"><%= vt.get(4)%></td>
                            <td class="data"><%= vt.get(5)%></td>
                            <td class="data" width="75px">
                    <center>
                        <a href='<%="ManagerProductServlet?action=edit&productid=" + vt.get(0)%>'>Sửa</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href='<%="ManagerProductServlet?action=del&productid=" + vt.get(0)%>'>Xóa</a>
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
