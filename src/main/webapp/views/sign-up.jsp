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
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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
                            <c:if test="${empty sessionScope.user}">
                                <li><a href="<c:url value='/login' />" style="color: red">Login</a></li>
                            </c:if>
                            <c:if test="${not empty sessionScope.user}">
                                <li><a href="<c:url value='/logout' />"style="color: red">Logout</a></li>
                                <li><i>Welcome,</i> <b>${sessionScope.user.username}</b></li>
                            </c:if>
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

<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active" data-bs-interval="1000">
                <img src="images/love.png" class="d-block w-100" alt="..." pl>
              </div>
              <div class="carousel-item" data-bs-interval="1000">
                <img src="images/love2.png" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item"data-bs-interval="1000">
                <img src="images/love3.png" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item"data-bs-interval="1000">
                <img src="images/love4.png" class="d-block w-100" alt="...">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
          <div class="box-search">
            <h3>Tìm Kiếm công việc</h3>
            <div class="box-search-option">
                <div class="col-sm-3">
                    <label class="visually-hidden" for="specificSizeInputName">Name</label>
                    <input type="text" class="form-control" id="specificSizeInputName" placeholder="Tìm công việc...">
                </div>
                <select class="form-select" id="specificSizeSelect">
                    <option selected>Phòng Ban</option>
                    <option value="1">Retails - Stores Operations</option>
                    <option value="2">Store Designs & Construction</option>
                    <option value="3">Marketing</option>
                    <option value="4">Expansion</option>
                    <option value="5">Finance & Accounting</option>
                    <option value="6">Franchise</option>
                    <option value="7">Human Resourses</option>
                    <option value="8">New Store Opening/Audit/Admin</option>
                    <option value="9">Supply Chain</option>
                    <option value="10">Manufacturing</option>
                    <option value="11">Licensing & Compliance</option>
                    <option value="12">Quality Control</option>
                    <option value="13">Consumer Insight</option>
                    <option value="14">Training</option>
                    <option value="15">Product Innovation</option>
                </select>
                <select class="form-select" id="specificSizeSelect">
                    <option selected>Địa Điểm</option>
                    <option value="1">Ho Chi Minh city</option>
                    <option value="2">Can Tho</option>
                    <option value="3">Kien Giang</option>
                    <option value="4">An Giang</option>
                    <option value="5">Dong Thap</option>
                    <option value="6">Ba Ria - Vung Tau</option>
                    <option value="7">Binh Duong</option>
                    <option value="8">Dong Nai</option>
                    <option value="9">Da Nang</option>
                    <option value="10">Ha Noi</option>
                </select>
                <button type="button" class="fas fa-search btn btn-outline-primary">Tìm cơ hội</button>
            </div>
        </div>
          <div class="whitespace"></div>
          <div class="big-box" style="background-image: url(images/tieuchi.png); width: 100%;" >
            <div class="big-content">
                <div class="big-content-wrapper">
                    <div class="big-content-image">
                        <img src="images/shared-vision-1.png" alt="">
                    </div>
                    <h3>Tầm nhìn</h3>
                </div>
                <div class="big-content-text">
                    <p>Trở thành thương hiệu cà phê và trà được yêu thích nhất tại Việt Nam và tự hào chia sẻ với thế giới.</p>
                </div>
            </div>
            <div class="big-content">
                <div class="big-content-wrapper">
                    <div class="big-content-image">
                        <img src="images/mission.png" alt="">
                    </div>
                    <h3>Sứ mệnh</h3>
                </div>
                <div class="big-content-text">
                    <p>Sứ mệnh của Coffee là đạt được ngôi vị quán quân về khẩu vị cà phê Việt Nam và phong cách quán cà phê hiện
                        đại, với giá cả hợp lý, sẵn sàng phục vụ mọi lúc, mọi nơi, mọi khách hàng.</p>
                </div>
            </div>
            <div class="big-content">
                <div class="big-content-wrapper">
                    <div class="big-content-image">
                        <img src="images/diamond.png" alt="">
                    </div>
                    <h3>Giá trị cốt lỗi</h3>
                </div>
                <div class="big-content-text">
                    <p>Quan tâm khách hàng
                        Tinh thần đồng đội & hợp tác
                        Tôn trọng & liêm chính
                        Tự hào Việt & chia sẻ đến cộng đồng
                        Đam mê</p>
                </div>
            </div>
        </div>
<div class="col-8 offset-2 mt-4">
                    <form action="<c:url value='/register'/>" method="POST">
                    <div class="card">
                        <div class="card-header">
                            <b>Registration</b>
                        </div>
                        <div class="card-body">
                        	
                        	
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="username">username</label>
                                        <input type="text" class="form-control" name="username" id="username" value="${user.username }"
                                            aria-describedby="usernamehelpId" placeholder="">
                                        <small id="usernamehelpId" class="form-text text-muted">username is
                                            required</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="fullname">fullname</label>
                                        <input type="text" class="form-control" name="fullname" id="fullname" value="${user.fullname }"
                                            aria-describedby="fullnamehelpId" placeholder="">
                                        <small id="fullnamehelpId" class="form-text text-muted">fullname is
                                            required</small>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="password">password</label>
                                        <input type="password" class="form-control" name="password" id="password"
                                            placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">email</label>
                                        <input type="email" class="form-control" name="email" id="email" value="${user.email}"
                                            aria-describedby="emailhelpId" placeholder="">
                                        <small id="emailhelpId" class="form-text text-muted">email is required</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                            <button class="btn btn-success">sign up</button>
                        </div>
                    </div>
                </form>
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/views/js/login.js"></script>
</body>
</html>