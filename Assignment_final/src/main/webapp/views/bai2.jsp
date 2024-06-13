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