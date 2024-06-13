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
<section class="main-content">				
    <div class="row">
        <div class="span9">					
            <h4 class="title"><span class="text"><strong>Your</strong> Cart</span></h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Remove</th>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Unit Price</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
    <c:forEach var="cartDetail" items="${sessionScope.cart.detail}">
        <tr id="tr-${cartDetail.value.masp}">
            <td><button onclick="removeSP('${cartDetail.value.masp}')" class="btn btn-danger" type="button">X</button></td>
            <td><img  src="images/${cartDetail.value.hinh}" style="width: 200px;height: 200px" alt="Product Image"></td>
            <td>${cartDetail.value.tensp}</td>
            <td><input id="slMua-${cartDetail.value.masp}" onchange="updateCart('${cartDetail.value.masp}')" type="number" class="input-mini" value="${cartDetail.value.slMua}"></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cartDetail.value.giasp}" /></td>
            <td>
                <span id="totalSP-${cartDetail.value.masp}">
                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${cartDetail.value.giasp * cartDetail.value.slMua}" />
                </span>
            </td>
        </tr>
        <input type="hidden" id="giaSP-${cartDetail.value.masp}" value="${cartDetail.value.giasp}" />
    </c:forEach>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td><strong id="tongTien"><fmt:formatNumber type="number" maxFractionDigits="3" value="${sessionScope.cart.tongtien}"/></strong></td>
    </tr>		  
</tbody>

            </table>
            <hr/>
            <div class="row-fluid">
                <div class="span6">
                    <div class="control-group">
                        <label class="control-label">Phone number:</label>
                        <div class="controls">
                            <input  id="phoneNumber" type="text" placeholder="" maxlength="11" class="input-xlarge">
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <div class="control-group">
                        <label class="control-label">Address:</label>
                        <div class="controls">
                            <input id="address" type="text" placeholder="" class="input-xlarge">
                        </div>
                    </div>
                </div>
            </div>
            <hr/>
            <p class="buttons center">				
                <button class="btn btn-danger" type="button" id="PayNow">Pay Now</button>
            </p>					
        </div>
    </div>
</section>
					
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
		<script src="<c:url value='home/themes/js/common.js' />"></script>
		<script>
		function removeSP(maSP) {
		    $.ajax({
		        url: 'cart?action=add&masp=' + maSP + '&soluong=0&isUpdate=0',
		        dataType: 'json'
		    }).then(function(data) {
		        $('#tongTien').text(numberWithDot(data.tongtien));
		        $('#countTotal').text(data.tongsl);
		        var idRemoveTag = '#tr-' + maSP;
		        $(idRemoveTag).remove();
		    }).fail(function(error) {
		        alert('Xóa thất bại, vui lòng thử lại!');
		    });
		}

		function updateCart(maSP) {
		    var idInputSL = '#slMua-' + maSP;
		    var slUpdate = $(idInputSL).val();
		    var idInputGiaSP = '#giaSP-' + maSP;
		    var giaSP = parseFloat($(idInputGiaSP).val());
		    if (parseInt(slUpdate) < 1) {
		        removeSP(maSP);
		    } else {
		        $.ajax({
		            url: 'cart?action=add&masp=' + maSP + '&soluong=' + slUpdate + '&isUpdate=1',
		            dataType: 'json'
		        }).then(function(data) {
		            $('#tongTien').text(numberWithDot(data.tongtien));
		            $('#countTotal').text(data.tongsl);
		            var tongTienSPUpdate = parseFloat(giaSP * parseInt(slUpdate));
		            var idTongGiaSP = '#totalSP-' + maSP;
		            $(idTongGiaSP).text(numberWithDot(tongTienSPUpdate));
		        }).fail(function(error) {
		            alert('Cập nhật thất bại, vui lòng thử lại!');
		        });
		    }
		}

		$('#PayNow').click(function() {
		  

		    var phone = $('#phoneNumber').val();
		    var address = $('#address').val();
		    if (phone.length == 0) {
		        alert('Vui lòng nhập số điện thoại');
		        $('#phoneNumber').focus();
		        return;
		    };
		    if (address.length == 0) {
		        alert('Vui lòng nhập địa chỉ');
		        $('#address').focus();
		        return;
		    }

		    $.ajax({
		        url: 'cart?action=paying&phone=' + phone + '&address=' + address,
		        dataType: 'json'
		    }).then(function(data) {
		        alert('Thanh toán thành công!');
		        window.location.href = "index";
		    }).fail(function(error) {
		        alert('Thanh toán thất bại, vui lòng thử lại!');
		    });
		});

		function numberWithDot(x) {
		    return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
		}

		</script>	
    </body>
</html>