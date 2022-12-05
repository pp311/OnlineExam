<%@page import="model.BEAN.Subject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.BEAN.Answer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="model.BEAN.Test"%>
<%@ page import ="model.BEAN.Question"%>
    
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
  	.countdown {
    	position: sticky;
    	top: 200px;
    	padding: 20px;
    	border: 3px solid red;
    	width: 100px;
    	text-align: center;
    	font-weight: bold;
    	font-size: 24px;
    }
    .countdown p {
    	margin: 0; 
    }
  </style>
  <body>
    <%@include file="navbar.jsp" %> 
    <% Test t = (Test)request.getAttribute("Test");
    	Subject s = (Subject)request.getAttribute("Subject");
    	List<Question> listQ = (List<Question>)request.getAttribute("listQ");
    	List<Answer> listA = (List<Answer>)request.getAttribute("listA");
    	DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy 'lúc' HH:mm");
    %>
    <div class="countdown">
	   	<input type="hidden" id="time" value="<%= t.getTime()%>">
		<p id="clock">00:00</p>
	</div>
    <form name="f1" action="DoTestServlet?IDTest=<%= t.getIdTest() %>" onSubmit='return checkAll()' method="post">

      <div class="content">
        <div class="header">
          <h3 style="text-align: center"><%= t.getTestName() %></h3>

          <div class="hd">
             <span class="top left">
              Môn thi:
              <label><%= s.getSubjectName() %></label>
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
		            	<% if(!listQ.get(i-1).isMultiChoice()){ %>
		            		<input type='radio' name=ra<%= listQ.get(i-1).getIdQuestion() %> value='<%= ans.getIdAnswer() %>' />
		            	<% }else{ %>
		            		<input type='checkbox' name=cb<%= listQ.get(i-1).getIdQuestion() %> value='<%= ans.getIdAnswer() %>' />
		            	<% } %>
		            	<label><%= ans.getContent() %></label>
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
    const clock = document.getElementById("clock");
    let time = document.getElementById("time").value *60;
    
    let min = Math.floor(time / 60);
    
    let sec = time - min * 60;
    
    let down = setInterval(() => {
		sec--;
		if(sec < 0) {
			min--;
			sec = 59;
		}
		if(min < 0) {
			const form = document.f1.submit();
			clearInterval(down);
		}
		clock.innerHTML = min + ":" + sec;
		

	}, 1000);
    
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
