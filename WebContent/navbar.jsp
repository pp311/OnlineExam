<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
        * {box-sizing: border-box;}

	   	body {
		    padding: 0;
		    margin: 0;
		    box-sizing: border-box;
		    text-decoration: none;
		    outline: none;
		}
        nav {
            display: flex;
            //align-items: center;
            width: 100%;
            background-color: #2A3F54;
            padding:  0 20px;
        }
        .nav-group {
            display: flex;
        }
        .nav-item {
            text-align: center;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            min-width: 120px;
            font-weight: bold;
            //height: 100%;
            display: flex;
            align-items: center;
        }
        .nav-right {
            margin-left: auto;
        }
        .nav-item:hover {
            background-color: #337AB7;
        }
        .nav-user-img {
            width: 30px;
            height: 30px;
            margin-right: 15px;
        }
        .nav-logout-img {
            width: 30px;
            height: 30px;
        }
        .nav-logout {
            min-width: 50px;
            margin: 0;
        }
    </style>
    <script src="https://kit.fontawesome.com/8533135931.js" crossorigin="anonymous"></script>
    <nav>
    
  	<% if(session.getAttribute("position").equals("student") ) { %>
	  	<div class="nav-group nav-left">
	  		<a href="lietkedethi" class="nav-item">Làm bài thi</a>
	        <a href="LichSuLamBaiServlet" class="nav-item">Lịch Sử Làm Bài</a>
	  	</div>
	  	<div class="nav-group nav-right">
	  		<a href="thongtincanhan" class="nav-item"><img src="./resources/icon/149071.png" class="nav-user-img"><%= (String)session.getAttribute("name") %></a>
	  		<a href="logout" class="nav-item nav-logout"><i class="fa-solid fa-right-from-bracket"></i></a>
	  	</div>
     <% } else if(session.getAttribute("position").equals("teacher")){ %>
       <div class="nav-group nav-left">
	       <a href="lietkedethi" class="nav-item">Danh sách bài thi</a>
        	<a href="CreateTestServlet" class="nav-item">Tạo bài thi</a>
       </div>
       	<div class="nav-group nav-right">
	  		<a href="thongtincanhan" class="nav-item"><img src="./resources/icon/149071.png" class="nav-user-img"><%= (String)session.getAttribute("name") %></a>
	  		<a href="logout" class="nav-item nav-logout"><i class="fa-solid fa-right-from-bracket"></i></a>
  		</div> 
  	<% } else {%>
	  	<div class="nav-group nav-left">
	  		<a href="lietkedethi" class="nav-item">Danh sách bài thi</a>
	        <a href="CreateTestServlet" class="nav-item">Tạo bài thi</a>
	        <a href="taotaikhoan" class="nav-item">Tạo tài khoản</a>
	  	</div>
        <div class="nav-group nav-right">
	  		<a href="thongtincanhan" class="nav-item"><img src="./resources/icon/149071.png" class="nav-user-img"><%= (String)session.getAttribute("name") %></a>
	  		<a href="logout" class="nav-item nav-logout"><i class="fa-solid fa-right-from-bracket"></i></a>
  		</div> 
		<% } %>        
        
    </nav>