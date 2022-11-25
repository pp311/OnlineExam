<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="model.BEAN.Test" %>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách đề thi</title>
  <link rel="stylesheet" href="./resources/css/lietkedethi.css">
</head>
<body>
  <div class="container">
    <h1>Danh sách đề thi</h1>
    <div class="list">
      <table>
        <thead>
          <tr>
            <th>Tên bài thi</th>
            <th>Số lượng câu hỏi</th>
            <th>Thời gian làm bài</th>
            <th>Thời gian bắt đầu</th>
            <th><%= (String)request.getAttribute("useraction") %></th>
          </tr>
        </thead>
        <tbody>
        <%
        	ArrayList<Test> testList = (ArrayList<Test>)request.getAttribute("testlist");
	        for(int i = 0; i < testList.size(); i++) { %>
	        	<tr>
		            <td><%= testList.get(i).getTestName() %></td>
		            <td><%= testList.get(i).getNumberQuestion() %></td>
		            <td><%= testList.get(i).getTimeInMinutes() %> (phút)</td>
		            <td><%= new SimpleDateFormat("dd/MM/yyyy HH:mm").format(testList.get(i).getDateTest()) %></td>
		            <td><a href="#"><%= (String)request.getAttribute("useraction") %></a></td>
		          </tr>
	      <% } %>  
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>