<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.BEAN.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      width: 400px;
    }
    .right{
      width: 200px;
    }
    .hd{
      width: fit-content;
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
      padding: 20px 85px;
      border-radius: 8px;
      background-color: white;
      width: 900px;
    }
    #createQuestion{
      text-align: center;
    }
    .Question{
      padding: 20px;
      border-radius: 8px;
      margin-bottom: 20px;
      background-color: white;
      width: 900px;
    }
    input[type="radio"],
    input[type="checkbox"] {
    	margin-left: 25px;
    	margin-right: 10px;
    }
    .statement{
      margin: 30px;
      width: 100%;
    }
    .statement *{      
      vertical-align: top;
    }
    
  </style>
  <body>
	<%@include file="navbar.jsp" %> 
	<% List<model.BEAN.Subject> listS = (List<model.BEAN.Subject>)request.getAttribute("listS"); 
	   int i; 
	   DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	%>
	
    <form name="f1" action="CreateTestServlet" onSubmit='return checkAll()' method="post">

      <div class="content">
        <div class="header" id="title">
          <h3>T???O ????? THI CHO SINH VI??N</h3>
          
          <div class="hd top">
          	T??n b??i thi: <input type="text" name="testName"><br>
          </div>

          <div class="hd">
  
            <span class="top left">
              Ng??y thi: <input type="datetime-local" name="dateTest" value="<%= formatter.format(new Date().getTime()) %>"/>
            </span>
            
            <span class="top right"> 
              Th???i gian thi: <input type="text" name="timeInMininutes" style="width: 30px" /> ph??t
            </span>
  
          </div>
  
          <div class="hd">
  
            <span class="top left">
              M??n thi:
              <select name="subjectTest">
              <% for(i = 0; i < listS.size(); i++) {%>              
                 <option value='<%= listS.get(i).getIDSubject() %>'>
                	<%= listS.get(i).getSubjectName() %>
                </option> 
                <%} %>
              </select>
            </span>
            
            <span class="top right">
              S??? c??u:
              <input type="text" name="numberQues" style="width: 30px" />
            </span>
            
          </div>
        
          <div id="createQuestion">
            <input type="button" value="T???o c??u h???i" style="padding: 5px; border-radius: 20px;" onclick="return numberChange();" />
          </div>
          
        </div>        

        <!-- class Question -->
        <!-- ... -->

      </div>

    </form>

    <script>

      function otherSubject() {
        var select = document.getElementsByName("subjectTest")[0].value;
        if (select == "Kh??c") {
          var selectBox = document.getElementsByName("subjectTest")[0];
          selectBox.insertAdjacentHTML(
            "afterend",
            ' <input type="text" name="subjectOther" />'
          );
        }else{
          var r = document.getElementsByName('subjectOther')[0];
          if(r != null) r.parentNode.removeChild(r);
        }
      }

      function addElements(i){
        var list = document.getElementsByClassName('st' + i);
        var end = list.length;

        var multi=document.getElementsByName('cb')[i-1];
        var choice = "";
        if(multi.checked) choice = "<input type='checkbox' name='cb" + i + "' value='" + (end+1) + "'/>"; 
        else choice = "<input type='radio' name='group" + i + "' value='" + (end+1) + "' />";         

        var s = "<div class='statement st" + i +
         "'><span class='sp" + i + "'>" + choice + "</span><textarea rows='1' cols='50' name='txt" + i + "'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" +
            i + "." + (end+1) + ")' width='20px'></div>"

          var button = document.getElementById("bAdd" + i);
          button.insertAdjacentHTML(
            "beforebegin",
            s
          );
          return false;
      }

      function removeStatement(id){
        var index = Number(id.toString().split('.')[0]);
        var subIndex = Number(id.toString().split('.')[1]);
        // alert(index + ", " + subIndex);
        
        var element = document.getElementsByClassName('st' + index);

        if(element[subIndex-1] != null) element[subIndex-1].remove();

        var init = subIndex-1;
        for(var i = init; i < element.length; i++){
          element[i].firstChild.firstChild.setAttribute("value", "" + subIndex);
          element[i].lastChild.setAttribute("onclick", 'removeStatement("' + index + '.' + subIndex++ + '")');
        }

        return false;
      }

      function removeAll(){
        element = document.getElementById('set');
        element.remove();
      }

      function numberQuestion(){
        var element = document.getElementsByClassName('Question');
        return element.length;
      }

      function numberChange() {
        var numberQues = document.getElementsByName("numberQues");
        var number = Number(numberQues[0].value);

        // alert(number);
        if (isNaN(number)) {
          alert("S??? c??u h???i kh??ng th??? ch???a ch??? c??i!");
          numberQues.value = "";
        }
        else if(number == ""){
          alert("B???n ch??a nh???p s??? c??u h???i!");
        }
        else{
          last = numberQuestion();

          if(last < number){ //S??? c??u h???i c?? ??t h??n s??? c??u h???i ???????c y??u c???u
            if(last == 0){  //Ch??a c?? c??u h???i n??o
              var tag = document.getElementById("title");
              var s = "";

              for(i = 1; i <= number; i++){
                s += "<div class='Question'><div class='statement'>C??u " + i + ": " + "<textarea rows='2' cols='50' name='txt" + i + "'></textarea><input name='cb' type='checkbox' style='margin-left:30px' value='" + i + "' onchange='replaceElements(" + i + ")' /> Cho ph??p ch???n nhi???u ????p ??n</div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' value='" + 1 + "'/></span><textarea rows='1' cols='50' name='txt" + i + "'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 1 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' value='" + 2 + "'/></span><textarea rows='1' cols='50' name='txt" + i + "'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 2 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' value='" + 3 + "'/></span><textarea rows='1' cols='50' name='txt" + i + "'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 3 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' value='" + 4 + "'/></span><textarea rows='1' cols='50' name='txt" + i + "'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 4 + ")' width='20px'></div>"
                + "<div class='statement' id='bAdd" + i + "'><input type='image' src='resources/icon/plus.png' onclick='addElements(" + i + "); return false;' width='16px'> Th??m c??u tr??? l???i</div><br></div>";
              }

              s += "<input type='submit' value='Ho??n th??nh' style='padding:10px; border-radius: 20px' /><a href='' onclick = 'removeAll(); return false;' style='float:right'>Xo?? h???t c??u h???i</a>";

              tag.insertAdjacentHTML(
                "afterend",
                '<div id="set"><hr>' + s + '</div>'
              );
            }
            else{ 
              var tag = document.getElementsByClassName('Question')[last-1];
              var s = "";

              for(i = last+1; i <= number; i++){
                s += "<div class='Question'><div class='statement'>C??u " + i + ": " + "<textarea rows='2' cols='50' name='txt" + i + "'></textarea><input name='cb' type='checkbox' style='margin-left:30px' value='" + i + "' onchange='replaceElements(" + i + ")' /> Cho ph??p ch???n nhi???u ????p ??n</div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' value='" + 1 + "' /></span><textarea rows='1' cols='50' name='txt" + i + "'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 1 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' value='" + 2 + "' /></span><textarea rows='1' cols='50' name='txt" + i + "'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 2 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' value='" + 3 + "' /></span><textarea rows='1' cols='50' name='txt" + i + "'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 3 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' value='" + 4 + "' /></span><textarea rows='1' cols='50' name='txt" + i + "'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 4 + ")' width='20px'></div>"
                + "<div class='statement' id='bAdd" + i + "'><input type='image' src='resources/icon/plus.png' onclick='addElements(" + i + "); return false;' width='16px'> Th??m c??u tr??? l???i</div><br></div>";
              }

              tag.insertAdjacentHTML(
                "afterend",
                s
              );
            }
          }
          else{   //S??? c??u h???i c?? nhi???u h??n ho???c b???ng s??? c??u h???i ???????c y??u c???u
            if(number == last) return;
            var list = document.getElementsByClassName('Question');
            var count = last - number;
            while(count > 0){
              list[number].remove();
              count--;
            }
          }
        }
      }

      function replaceElements(i){
        var multi=document.getElementsByName('cb')[i-1];
        if(multi.checked){
          var ele = document.getElementsByClassName("sp" + i);
          for(var j = 0; j < ele.length; j++){
            ele[j].innerHTML = "<input type='checkbox' name='cb" + i + "' value='" + (j+1) + "'/>"; 
          }    
        }else{
          var ele = document.getElementsByClassName("sp" + i);
          for(var j = 0; j < ele.length; j++){
            ele[j].innerHTML = "<input type='radio' name='group" + i + "' value='" + (j+1) + "'/>";   
          }   
        }
      }
      
      function checkAll(){
		  var testName = document.getElementsByName("testName")[0].value;
		  if(testName == ""){
			  alert("T??n b??i thi kh??ng th??? ????? tr???ng!");
			  return false;
		  }
		  
    	  var date = document.getElementsByName("dateTest")[0].value;
    	  var milliseconds = (new Date()).getTime() - new Date(date).getTime();
		  if(milliseconds >= 0){
			  alert("Ng??y thi ph???i sau th???i ??i???m hi???n t???i!");
			  return false;
		  }

		  var date = document.getElementsByName("timeInMininutes")[0].value;
		  if(isNaN(Number(date)) || date <= 0){
			  alert("Th???i gian thi ph???i l?? s??? d????ng!");
			  return false;
		  }

		  var numQues = document.getElementsByName("numberQues")[0].value;
		  if(isNaN(Number(numQues)) || numQues <= 0){
			  alert("S??? c??u h???i ph???i l?? s??? d????ng!");
			  return false;
		  }
		  
		  if(numQues != numberQuestion()){
			  alert("S??? c??u kh??ng kh???p v???i s??? c??u h???i b???n ???? t???o!");
			  return false;
		  }
		  
		  var multiChoice = document.getElementsByName("cb");					//get list Checkbox multiple choice
		  for(var i = 1; i <= multiChoice.length; i++) {
		  	var checked = false;
			if(multiChoice[i-1].checked) {		
				var ansCB = document.getElementsByName("cb" + i);
				for(var j = 0; j < ansCB.length; j++){
					if(ansCB[j].checked) {checked = true; break;}
				}
			}
			else {
				var ansRD = document.getElementsByName("group" + i);
				for(var j = 0; j < ansRD.length; j++){
					if(ansRD[j].checked) {checked = true; break;}
				}	
			} 
			if(!checked){
				alert("B???n ch??a ch???n ????p ??n cho c??u h???i th??? " + i + "!");
			    return false;
			}
		  }   
		  
    	  return true;
      }

    </script>
  </body>
</html>
