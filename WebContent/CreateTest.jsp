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
    }
    #createQuestion{
      text-align: center;
    }
    .Question{
      padding: 20px;
      border-radius: 8px;
      margin-bottom: 20px;
      background-color: white;
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
    <form name="f1" action="CreateTestServlet">

      <div class="content">
        <div class="header" id="title">
          <h3>TẠO ĐỀ THI CHO SINH VIÊN</h3>

          <div class="hd">
  
            <span class="top left">
              Ngày thi: <input type="datetime-local" name="dateTest" value="2022-12-01T07:00"/>
            </span>
            
            <span class="top right"> 
              Thời gian thi: <input type="text" name="pass" style="width: 30px" /> phút
            </span>
  
          </div>
  
          <div class="hd">
  
            <span class="top left">
              Môn thi:
              <select id="subjectTest" onchange="otherSubject();">
                <option>Công nghệ web</option>
                <option>Lập trình mạng</option>
                <option>Chương trình dịch</option>
                <option>Toán UDCNTT</option>
                <option>Khác</option>
              </select>
            </span>
            
            <span class="top right">
              Số câu:
              <input type="text" id="numberQues" style="width: 30px" />
            </span>
            
          </div>
        
          <div id="createQuestion">
            <input type="submit" value="Tạo câu hỏi" style="padding: 5px; border-radius: 20px;" onclick="numberChange(); return false;" />
          </div>
          
        </div>        

        <!-- class Question -->
        <!-- ... -->

      </div>

    </form>

    <script>

      function otherSubject() {
        var select = document.getElementById("subjectTest").value;
        if (select == "Khác") {
          var selectBox = document.getElementById("subjectTest");
          selectBox.insertAdjacentHTML(
            "afterend",
            ' <input type="text" id="subjectOther" />'
          );
        }else{
          var r = document.getElementById('subjectOther');
          if(r != null) r.parentNode.removeChild(r);
        }
      }

      function addElements(i){
        var list = document.getElementsByClassName('st' + i);
        var end = list.length;

        var multi=document.getElementsByClassName('cb'), choice = "";
        if(multi[i-1].checked) choice = "<input type='checkbox' />"; 
        else choice = "<input type='radio' name='group" + i + "' />";         

        var s = "<div class='statement st" + i +
         "'><span class='sp" + i + "'>" + choice + "</span><textarea rows='1' cols='50' class='txt'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" +
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
        var numberQues = document.getElementById("numberQues");
        var number = Number(numberQues.value);

        // alert(number);
        if (isNaN(number)) {
          alert("Số câu hỏi không thể chứa chữ cái!");
          numberQues.value = "";
        }
        else if(number == ""){
          alert("Bạn chưa nhập số câu hỏi!");
        }
        else{
          last = numberQuestion();

          if(last < number){ //Số câu hỏi cũ ít hơn số câu hỏi được yêu cầu
            if(last == 0){  //Chưa có câu hỏi nào
              var tag = document.getElementById("title");
              var s = "";

              for(i = 1; i <= number; i++){
                s += "<div class='Question'><div class='statement'>Câu " + i + ": " + "<textarea rows='2' cols='50' class='txt'></textarea><input class='cb' type='checkbox' style='margin-left:30px' value='multiple' onchange='replaceElements(" + i + ")' /> Cho phép chọn nhiều đáp án</div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50' class='txt'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 1 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50' class='txt'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 2 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50' class='txt'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 3 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50' class='txt'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 4 + ")' width='20px'></div>"
                + "<div class='statement' id='bAdd" + i + "'><input type='image' src='resources/icon/plus.png' onclick='addElements(" + i + "); return false;' width='16px'> Thêm câu trả lời</div><br></div>";
              }

              s += "<input type='submit' value='Hoàn thành' style='padding:10px; border-radius: 20px' /><a href='' onclick = 'removeAll(); return false;' style='float:right'>Xoá hết câu hỏi</a>";

              tag.insertAdjacentHTML(
                "afterend",
                '<div id="set"><hr>' + s + '</div>'
              );
            }
            else{ 
              var tag = document.getElementsByClassName('Question')[last-1];
              var s = "";

              for(i = last+1; i <= number; i++){
                s += "<div class='Question'><div class='statement'>Câu " + i + ": " + "<textarea rows='2' cols='50' id='txt[]'></textarea><input class='cb' type='checkbox' style='margin-left:30px' value='multiple' onchange='replaceElements(" + i + ")' /> Cho phép chọn nhiều đáp án</div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50' class='txt'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 1 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50' class='txt'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 2 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50' class='txt'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 3 + ")' width='20px'></div>"
                + "<div class='statement st" + i + "'><span class='sp" + i + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50' class='txt'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(" + i + "." + 4 + ")' width='20px'></div>"
                + "<div class='statement' id='bAdd" + i + "'><input type='image' src='resources/icon/plus.png' onclick='addElements(" + i + "); return false;' width='16px'> Thêm câu trả lời</div><br></div>";
              }

              tag.insertAdjacentHTML(
                "afterend",
                s
              );
            }
          }
          else{   //Số câu hỏi cũ nhiều hơn hoặc bằng số câu hỏi được yêu cầu
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
        var multi=document.getElementsByClassName('cb');
        if(multi[i-1].checked){
          var ele = document.getElementsByClassName("sp" + i);
          for(var j = 0; j < ele.length; j++){
            ele[j].innerHTML = "<input type='checkbox' />"; 
          }    
        }else{
          var ele = document.getElementsByClassName("sp" + i);
          for(var j = 0; j < ele.length; j++){
            ele[j].innerHTML = "<input type='radio' name='group" + i + "' />";   
          }   
        }
      }

    </script>
  </body>
</html>
