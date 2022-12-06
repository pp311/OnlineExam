<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<% ArrayList<LichSuLamBai> listKQ = (ArrayList)request.getAttribute("listKQ");
		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy 'lúc' HH:mm");
	%>
  <div class="container">
    <h1>Danh sách bài thi đã làm</h1>
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
        	<% for(int i = 0;i<listKQ.size();i++){
        		%>  	
	        <tr>          
		       <td><%=listKQ.get(i).getTestName() %></td>
		       <td><%=listKQ.get(i).getGrade() %></td>
		       <td><%=formatter.format(listKQ.get(i).getSubmitTime().getTime()) %></td>
	        </tr>        
 			<%} %>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>