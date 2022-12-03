<%@page import="model.BEAN.History"%>
<%@page import="model.BEAN.Result"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="model.BEAN.Test"%>
<%@ page import ="model.BEAN.Question"%>
<%@page import="model.BEAN.Answer"%>
    
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, lastial-scale=1.0" />
    <title>Document</title>
  </head>
  <style>
    .top {
      margin-top: 20px;
      margin-bottom: 20px;
      display: inline-block;
    }
    .left{
      width: 60%;
    }
    [name=f1] {
      padding: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #f0ebf8;
    }
    .content{
      display: flex;
      justify-content: center;
      align-items: center;
      width: 70%;
      flex-direction: column;
      background-color: #f0ebf8;
    }
    .header{
      padding: 20px;
      padding-left: 40px;
      border-radius: 8px;
      background-color: white;
      width: 100%;
    }
    .Question{
      padding: 30px 20px 20px 40px;
      padding-left: 40px;
      border-radius: 8px;
      background-color: white;
      margin-bottom: 20px;    
      width: 100%;
      
    }
    .statement{
    	margin-bottom: 20px;
    }
    hr{
	    border: 0;
	    clear: both;
	    display: block;
	    width: 100%;
	    background-color: gray;
	    height: 1px;
  	}
  </style>
  <body>
    <% Test t = (Test)request.getAttribute("Test");
    	List<Question> listQ = (List<Question>)request.getAttribute("listQ");
    	List<Answer> listA = (List<Answer>)request.getAttribute("listA");
    	Result rs = (Result)request.getAttribute("rs");
    	List<History> listH = (List<History>)request.getAttribute("listH");
    	DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy 'lúc' HH:mm");
    %>
    <%@include file="navbar.jsp" %> 
    <form name="f1" action="ViewTestServlet?IDTest=<%= t.getIdTest() %>" onSubmit='return checkAll()' method="post">

      <div class="content">
        <div class="header">
          <h3 style="text-align: center">KẾT QUẢ KIỂM TRA</h3>

          <div class="hd">
             <span class="top left">
              Môn thi:
              <label><%= t.getTestName() %></label>
            </span>
            
            <span class="top right"> 
              Thời gian thi: <label><%= t.getTime() %> phút</label>
            </span>
  
          </div>
  
          <div class="hd">
  
            <span class="top left">
              Ngày thi: <label> <%= formatter.format(t.getDateTest().getTime()) %></label>
            </span>
            
            <span class="top right">
              Số câu:
              <label><%= t.getNumberQuestion() %></label>
            </span>
            
          </div>
  
          <div class="hd">
  
            <span class="top left">
              Sinh viên: <label> <%= rs.getUserName() %></label>
            </span>
            
            <span class="top right">
              Số điểm:
              <label><%= rs.getGrade() %></label>
            </span>
            
            <span class="top right">
              Thời gian nộp:
              <label><%= rs.getSubmitTime() %></label>
            </span>
            
          </div>
          
         </div>
			<hr>        
	        <% 
	        int count = 0;
	        for(int i = 1; i <= listQ.size(); i++){ %>
	        
	        <div class='Question'><div class='statement'>Câu <%= i %>: <label><%= listQ.get(i-1).getContent() %></label></div>
	 		
	 		<% 
				Answer ans = listA.get(count++);
				while(ans.getIdQuestion() == listQ.get(i-1).getIdQuestion()) { %>
	 				
		            <div class='statement'>
		            	<% if(!listQ.get(i-1).isMultiChoice()){
		            		if(listH.contains(ans.getIdAnswer())){ %>
		            			<input type='radio' name=ra<%= listQ.get(i-1).getIdQuestion() %> value='<%= ans.getIdAnswer() %>' checked disabled /> <label><%= ans.getContent() %></label> <input type='image' <% if(ans.isCorrectAnswer()){ %> src='resources/icon/correct.png' width='20px'<% } else{ %> src='resources/icon/wrong.png'  width='15px'<%} %>  >
		            		<% }else{ %>
		            			<input type='radio' name=ra<%= listQ.get(i-1).getIdQuestion() %> value='<%= ans.getIdAnswer() %>' disabled/> <label><%= ans.getContent() %></label> <input <% if(ans.isCorrectAnswer()){ %> type='image' src='resources/icon/correct.png' width='20px'<% } else{ %> type='hidden'  <%} %>  >
		            		<% }
	            		}else{
		            		if(listH.contains(ans.getIdAnswer())){ %>
		            			<input type='checkbox' name='cb' value='<%= ans.getIdAnswer() %>' checked disabled/> <label><%= ans.getContent() %></label> <input type='image' <% if(ans.isCorrectAnswer()){ %> src='resources/icon/correct.png' width='20px'<% } else{ %> src='resources/icon/wrong.png' width='15px'<%} %>   > 
		            		<% }else{ %>
		            			<input type='checkbox' name='cb' value='<%= ans.getIdAnswer() %>' disabled/> <label><%= ans.getContent() %></label> <input <% if(ans.isCorrectAnswer()){ %> type='image' src='resources/icon/correct.png' width='20px'<% } else{ %> type='hidden'  <%} %>   > 
		            		<% }	
	            		} %>
	            	</div>
	 				
	 				<% 
	 				if(count >= listA.size()) break; 
	 				ans = listA.get(count++);
	 			}; %>
	        	</div>
	 			<% count--;
	 		     
			} %>    
          	<div style="width: 106%;"><input type='submit' value='Hoàn thành' style='padding:10px; border-radius: 20px' /><a href='' onclick = 'removeAll(); return false;' style='float:right'>Xoá hết câu trả lời</a></div>
          </div> 

    </form>

    <script>
      function removeAll(){
    	  var choice = document.getElementsByName("cb");
    	  if(choice != null){
    		  for(var i = 0; i < choice.length; i++){
    			  if(choice[i].checked) choice[i].checked = false;
    		  }
    	  }
    	  var choice = document.getElementsByName("group");
    	  if(choice != null){
    		  for(var i = 0; i < choice.length; i++){
    			  if(choice[i].checked) choice[i].checked = false;
    		  }
    	  }
      }  
    
      function checkAll(){
		  
		  //bug 1
		 /*  var multi=document.getElementsByName('cb')[0];
		  //var multiChoice = document.getElementsByName("cb");					//get list Checkbox multiple choice
 		if(multi.checked) alert("yes");
		else alert("no");   */
			   /* for(var i = 1; i <= multiChoice.length; i++) {
				
				if(multiChoice[i-1] != null) {		
					alert("hello");
					var correct = document.getElementsByName("cb" + i);
					alert(correct.length);
				}
				else {alert("hello2");
					var correct = document.getElementsByName("group" + i);
					alert(correct.length);	
				}
			}   */

			//bug 2: nhấn quay lui
    	  return true;
      }

    </script>
  </body>
</html>
