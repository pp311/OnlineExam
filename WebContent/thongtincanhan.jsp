<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Thông tin cá nhân</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="./resources/css/thongtincanhan.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="card">
                <h2>Thông tin cá nhân</h2>
                <form action="">
                    <label for="mssv">Mã số sinh viên</label>
                    <br>
                    <input type="text" id="mssv" name="mssv" value="102200226"  >
                    <br>
                    <label for="name">Họ và tên</label>
                    <br>
                    <input type="text" id="name" name="name" value=""  >
                    <br>
                    <label for="class">Lớp sinh hoạt</label>
                    <br>
                    <input type="text" id="class" name="class" value=""  >
                    <br>
                    <label for="faculty">Khoa</label>
                    <br>
                    <input type="text" id="faculty" name="faculty" value=""  >
                    <br>
                    <label >Giới tính</label>
                    <br>
                    <input type="radio" id="male" name="gender" value="male"><label for="male">Nam</label>
                    <input type="radio" id="female" name="gender" value="female"><label for="female">Nữ</label>
                    <br>
                    <input type="submit" name="change-info-submit-btn" value="Lưu" class="submit-btn">
                </form>
            </div>
            <div class="card">
                <h2>Đổi mật khẩu</h2>
                <form action="" name="change-password-form">
                    <label for="current-password">Mật khẩu hiện tại</label>
                    <br>
                    <input type="password" id="current-password">
                    <br>
                    <label for="new-password">Mật khẩu mới</label>
                    <br>
                    <input type="password" id="new-password">
                    <br>
                    <label for="new-password2">Xác nhận mật khẩu</label>
                    <br>
                    <input type="password" id="new-password2">
                    <br>
                    <input type="submit" value="Đổi mật khẩu" name="change-password-submit-btn" class="submit-btn">
<!--                    <button class="submit-btn">Đổi mật khẩu</button>-->
                </form>
            </div>
        </div> 
    </body>
</html>