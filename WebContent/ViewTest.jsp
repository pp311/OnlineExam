<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="model.BEAN.ViewTest" %>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách sinh vien</title>
  <link rel="stylesheet" href="./resources/css/lichsulambai.css">
</head>
<body>
	<%@include file="navbar.jsp" %>
	<% ArrayList<ViewTest> listKQ = (ArrayList)request.getAttribute("listKQ"); %>
  <div class="container">
    <h1>Danh sách sinh viên</h1>
    <div class="list">
      <table>
        <thead>
          <tr>
            
            <th>Tên</th>
            <th>Điểm</th>
            <th>Thời gian nộp bài</th>
            <th>Xem chi tiết</th>
          </tr>
        </thead>
        <tbody>
        	<% for(int i = 0;i<listKQ.size();i++){
        		%>  	
	        <tr>          
		       <td><%=listKQ.get(i).getName() %></td>
		       <td><%=listKQ.get(i).getGrade() %></td>
		       <td><%=listKQ.get(i).getSubmitTime() %></td>
		       <td><a href ="#"?<%=listKQ.get(i).getUserName() %>>Xem</a></td>
	        </tr>        
 			<%} %>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>