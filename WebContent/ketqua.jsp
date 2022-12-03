<%@page import="model.BEAN.Result"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="model.BEAN.LichSuLamBai" %>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách đề thi</title>
  <link rel="stylesheet" href="./resources/css/lichsulambai.css">
</head>
<body>
	<%@include file="navbar.jsp" %>
	<% Result rs = (Result)request.getAttribute("rs"); 
		String nametest = (String)request.getAttribute("nametest");
	%>
  <div class="container">
    <h1>Kết quả làm bài</h1>
    <div class="list">
      <table>
        <thead>
          <tr>
            
            <th>Tên bài thi</th>
            <th>Điểm</th>
            <th>Thời gian nộp bài</th>
          </tr>
        </thead>
        <tbody>
        	
	        <tr>          
		       <td><%=nametest %></td>
		       <td><%=rs.getGrade() %></td>
		       <td><%=rs.getSubmitTime() %></td>
	        </tr>        
 
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>