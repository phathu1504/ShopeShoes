<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator</title>
</head>
<body>
    
    <form action="Bai1Servlet" method="post">
        <input type="text" name="a" placeholder="Enter a" /> <br /><br />
        <input type="text" name="b" placeholder="Enter b"/> <br /><br />
        
        <hr />
  
    <input type="submit" formaction="${pageContext.request.contextPath}/Bai1Servlet/sum" value="Add" />
    <input type="submit" formaction="${pageContext.request.contextPath}/Bai1Servlet/tru" value="Subtract" /> 
    <input type="submit" formaction="${pageContext.request.contextPath}/Bai1Servlet/nhan" value="Multiply" /> 
    <input type="submit" formaction="${pageContext.request.contextPath}/Bai1Servlet/chia" value="Divide" />

        
    </form>
    <hr />
    Result: ${message }
    
</body>
</html>
