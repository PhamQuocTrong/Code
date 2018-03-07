<%-- 
    Document   : header
    Created on : Oct 1, 2017, 1:32:56 AM
    Author     : kuminhdey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
    </head>
    <body>
        <header>
            <div class="top-bar navbar-fixed-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="pull-left">
                                <div class="lang">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default dropdown-toggle no-boder" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #d23091;">
                                            Vietnamese <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu no-boder">
                                            <li><a href="#" style="color: #d23091;">Vietnamese</a></li>
                                            <li><a href="#" style="color: #d23091;">English</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="pull-right">
                                <ul class="list-unstyled top-links">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">Giỏ hàng</a></li>
                                    <li><a href="#" onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;">Đăng nhập</a></li>
                                    <li><a href="#" onclick="document.getElementById('id02').style.display = 'block'">Đăng ký</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="id01" class="modal login-form"> 
                <form class="modal-content animate" action="UserServlet">
                    <div class="imgcontainer">
                        <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                    </div>
                    <h3 class="text-center">ĐĂNG NHẬP</h3>
                    <div class="login" >
                        <label><b>Tên đăng nhập</b></label>
                        <input type="text" placeholder="Nhập tài khoản"  required name="username">

                        <label><b>Mật khẩu</b></label>
                        <input type="password" placeholder="Nhập mật khẩu" required name="pass">

                        <button type="submit">Đăng nhập</button>
                        <input type="checkbox" checked="checked"> Nhớ tài khoản
                    </div>
                    <div style="background-color:#f1f1f1">
                        <button type="button" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn">Cancel</button>
                        <span class="psw"><a href="#">Quên mật khẩu?</a></span>
                    </div>
                </form>
            </div>
            <div id="id02" class="modal sign-form"> 
                <form class="modal-content animate" action="UserServlet" method="POST">
                    <div class="imgcontainer">
                        <span onclick="document.getElementById('id02').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                    </div>
                    <h3 class="text-center">ĐĂNG KÝ</h3>
                    <div class="sign">
                        <label><b>Tên đăng nhập</b></label>
                        <input type="text" placeholder="Nhập tên đăng nhập"  required name="username">

                        <label><b>Email</b></label>
                        <input type="email" placeholder="Nhập email"  required name="email">

                        <label><b>Mật khẩu</b></label>
                        <input type="password" placeholder="Nhập mật khẩu" required name="pass">

                        <label><b>Nhập lại mật khẩu</b></label>
                        <input type="password" placeholder="Nhập lại mật khẩu" required>

                        <input type="checkbox" checked="checked"> Nhớ tài khoản
                        <p>Bằng việc click vào các nút Đăng ký bạn đã đồng ý <a href="#">Điều khoản sử dụng</a>.</p>
                        <div class="clearfix">
                            <button type="submit" onclick="document.getElementById('id02').style.display = 'none'" style="background-color: #f44336;">Cancel</button>
                            <button type="submit" name="action" value="add">Đăng Ký</button>
                        </div>            
                    </div>
                </form>
            </div>
            <div class="main-header">
                <div class="container">
                    <div class="row">
                         <div class="col-sm-5">
                            <div class="logo text-center" >
                                <a href="index.jsp"><img src="images/logo.png" style="width:400px;height: 80px;margin-left: -100px;"></a>
                            </div>
                        </div>
                        <div class="col-sm-3 search-w">
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button"><i class="glyphicon glyphicon-search" style="width: 14px; height: 20.2px;"></i></button>
                                    </span>
                                </div>
                            </div>
                        </div>
                       <div class="col-sm-4" style="
    padding-right: 0px;
">
                            <div class="pull-right">
                                <div class="cart-wish-w">
                                    <div class="cart-w">
                                        <div class="cart-info">
                                            <span>
                                                <strong>0 Sản Phẩm</strong>
                                            </span>
                                            <a href="#" class="btn-cart">
                                                <i class="glyphicon glyphicon-shopping-cart"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="wishlist-w">
                                        <div class="wishlist-info">
                                            <span>
                                                <strong>0 Yêu Thích</strong>
                                            </span>
                                            <a href="" class="btn-cart">
                                                <i class="glyphicon glyphicon-heart"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main">
                <div class="container">
                    <div class="row">
                        <div class="main-nav">
                            <div class="container">
                                <div class="row" >
                                    <ul class="nav nav-pills">
                                        <li class="active"><a href="index.jsp"><i class="glyphicon glyphicon-home"></i> Trang chủ<span class="sr-only">(current)</span></a></li>
                                        <li><a href="#">Giới thiệu</a></li>
                                        <li><a href="#">Sản phẩm</a></li>
                                        <li><a href="#">Thương hiệu</a></li>
                                        <li><a href="#lienhe">Liên hệ</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
