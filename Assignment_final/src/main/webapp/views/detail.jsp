<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Enter your description here" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <title>Website</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
    
</head>
<body>
<div class="container" style="background-color: #F5FFFA">
<nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: white; height: 100px;">
    <nav class="navbar bg-body-tertiary">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="images/Youy.png" alt="Bootstrap" width="100px" height="100px">
            </a>
        </div>
    </nav>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <div class="navbar">
            <div class="container-fluid">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#!web">
                            <span style="color: red; font-size:medium;" class="fas fa-home"> Trang chủ</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown" style="margin-left: 10px;">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: red">Tài khoản</a>
                        <ul class="dropdown-menu">
    <c:choose>
        <c:when test="${empty sessionScope.user}">
            <li><a href="<c:url value='/login' />" style="color: red">Login</a></li>
            <li><a href="<c:url value='/register' />" style="color: red">Đăng Kí</a></li>
        </c:when>
        <c:otherwise>
            <li><a href="<c:url value='/logout' />" style="color: red">Logout</a></li>
            <li><i>Welcome,</i> <b>${sessionScope.user.username}</b></li>
        </c:otherwise>
    </c:choose>


                       
                        </ul>
                    </li>
                    <li class="nav-item" style="margin-left: 10px;">
                        <a class="nav-link" href="#!giohang" >
                            <li ><a href="<c:url value='/cart?action=view' />">  <span style="color: red; font-size:medium; margin-top: 13px" class="fas fa-home"> Giỏ Hàng</span> <b style="color: red" >(<span id="countTotal">${sessionScope.cart.tongsl}</span>)</b></a></li>
                        </a>
                    </li>
                     <div class="languageTop">
                    <ul>
                        <li><a href=" "><img src="images/flag-vn.png" alt="VN"></a></li>
                        <li><a href=" "><img src="images/flag-en.png" alt="EN"></a></li>
                    </ul>
                </div>
                </ul>
               
            </div>
        </div>
    </div>
</nav>
	<section class="header_text sub">
    <h4><span>${product.tensp}</span></h4>
</section>
<div class="row">						
    <div class="span9">
        <div class="row">
            <div class="span4">
                <img alt="" id="productImage" src="<c:url value='images/${product.hinh}' />" style="width: 200px;height: 200px">
            </div>
            <div class="span5">
                <address>
                    <strong>Availability:</strong> <span>${product.soluong}</span><br>
                    <input type="hidden" id="maSP" value="${product.masp}"/>
                    <input type="hidden" id="soLuongTrongKho" value="${product.soluong}"/>
                    <input type="hidden" id="hinhAnh" value="images/${product.hinh}">
                    
                </address>									
                <h4><strong>Price: <fmt:formatNumber type="number" maxFractionDigits="3" value="${product.giasp}" /></strong></h4>
            </div>
            <div class="span5">
                <form class="form-inline">
                    <p>&nbsp;</p>
                    <label>Qty:</label>
                    <input id="soLuongMua" type="number" value="1" class="span1" placeholder="1" min="1" max="${product.soluong}">
                    <button class="btn btn-inverse" type="button" id="addToCart">Add to cart</button>
                </form>
            </div>							
        </div>
    </div>
</div>

			<!--footer -->
<div class="career-footer">
    <div class="footer-border"></div>
    <div class="footer-border"></div>
    <div class="footer-border"></div>
</div>
<div class="footer-title">
    <h5>Đồng hành cùng Tôi trên</h5>
</div>
<div class="footer-icon">
    <a href="https://www.facebook.com/"><i class="fa-brands fab fa-facebook"></i></a>
    <a href="https://www.instagram.com/"><i class="fa-brands fab fa-instagram"></i></a>
    <a href=""><i class="fa-brands fab fa-youtube"></i></a>
</div>
<div class="footer-copy-right">
    <p>10april2k4@gmail.com</p>
</div>
</div>
<script src="trangchu.js"></script>
<script src="https://unpkg.com/scrollreveal@4.0.7/dist/scrollreveal.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/js/bootstrap.min.js"></script>
<script src="<c:url value='home/themes/js/common.js' />"></script>
</body>
</html>
    <script>
    $('#addToCart').click(function() {
        var maSP = $('#maSP').val();
        var soLuongMua = parseInt($('#soLuongMua').val());
        var soLuongTrongKho = parseInt($('#soLuongTrongKho').val());
        var hinhAnh = $('#hinhAnh').val(); // Lấy đường dẫn hình ảnh từ phần tử input hidden

        if (soLuongMua > soLuongTrongKho || soLuongMua < 1) {
            alert('Kiểm tra lại số lượng');
        } else {
            $.ajax({
                url: 'cart?action=add&masp=' + maSP + '&soluong=' + soLuongMua + '&isUpdate=0',
                dataType: 'json'
            }).then(function(data) {
                alert('Thêm thành công vào giỏ hàng!');
                $('#countTotal').text(data.tongsl);

                // Cập nhật hình ảnh
                $('#productImage').attr('src', hinhAnh);
            }).fail(function(error) {
                alert('Thêm thất bại, vui lòng thử lại!');
            });
        }
    });


</script>
</html>