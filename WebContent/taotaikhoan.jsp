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
        <form action="">
            <label for="mssv">Mã số sinh viên</label>
            <br>
            <input type="text" id="mssv" name="mssv" value="102200226" required>
            <br>
            <label for="name">Tên tài khoản</label>
            <br>
            <input type="text" id="name" name="name" value="" required>
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
            <input type="submit" name="change-info-submit-btn" value="Lưu" class="submit-btn">
        </form>
    </div>
</div>
</body>
</html>