<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Đăng nhập</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="./resources/css/login.css" rel="stylesheet">
    </head>
    <body>
<div class="container">
    <h1>ĐĂNG NHẬP</h1>
<form method="post" action="checklogin">
  <input type="text" id="username" name="username" placeholder="Tên đăng nhập" required>
  <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
  <% 
  	String err = request.getParameter("err");
  	if(err != null && err.equals("1")) {
  		out.print("<p style='color:red; margin-bottom:5px;'>Sai tên tài khoản hoặc mật khẩu</p>");
  	}
  %>
  
  <button class="submit-btn">Đăng nhập</button>
</form>
</div>
</body>
</html>
