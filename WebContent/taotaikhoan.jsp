<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tạo tài khoản</title>
    <link rel="stylesheet" href="./resources/css/taotaikhoan.css">
</head>
<body>
<div class="container">
    <div class="card">
        <h2>Tạo tài khoản</h2>
        <form method="post" action="taotaikhoan" >
            <label for="mssv">Mã số sinh viên</label>
            <br>
            <input type="text" id="mssv" name="mssv" value="" required>
            <br>
            <label for="username">Tên tài khoản</label>
            <br>
            <input type="text" id="username" name="username" value="" required>
            <br>
            <label for="password">Mật khẩu</label>
            <br>
            <input type="password" id="password" name="password" value="" required >
            <br>
            <label for="position">Vị trí</label>
            <br>
            <select name="position" id="position" >
                <option value="teacher">Giáo viên</option>
                <option value="student">Sinh viên</option>
            </select>
            <br>
            <% 
			  	if(request.getAttribute("err") != null) {
			  		out.print("<p style='color:red; margin-bottom:5px;'>" + (String)request.getAttribute("err") + "</p>");
			  	}
			  	else if(request.getAttribute("success") != null) {
			  		out.print("<p style='color:green; margin-bottom:5px;'>" + (String)request.getAttribute("success") + "</p>");
			  	}
			%>
            <input type="submit" name="change-info-submit-btn" value="Lưu" class="submit-btn">
        </form>
    </div>
</div>
</body>
</html>