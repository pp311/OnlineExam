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
    <form name="f1" action="ProgressCreate.php">

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

      function addElements(index){
        var stID, ele, j = 0;
        do{
          j++;
          stID = "st" + index + "." + j;
          ele = document.getElementById(stID);
        }
        while(ele != null);

        var s = "<div class='statement' id='" + stID +
         "'><span id='" + index + "." + j + "'><input type='radio' name='group" +
          index + "' /></span><textarea rows='1' cols='50'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(\"" + index + "." + j +
          "\")' width='20px'></div>";
          var button = document.getElementById("bAdd" + index);
          button.insertAdjacentHTML(
            "beforebegin",
            s
          );
          return false;
      }

      function removeElements(id){
          // var parent = document.getElementsByName('f1');
          var child = document.getElementById(id);
          if(child != null) {
            // child.innerHTML = "";
            // parent.removeChild(child);
            // r.parentNode.removeChild(r);
            child.remove();
          }
      }

      function removeStatement(id){
        var index = id.split('.')[0];
        var subIndex = Number(id.split('.')[1]);
        // alert(index + ", " + subIndex);
        var element = document.getElementById('st' + id);
          if(element != null) {
            element.remove();
          }

        element = document.getElementById('st' + index + '.' + (subIndex+1));
        while(element != null){
          element.id = 'st' + index + '.' + subIndex;          
          element.firstChild.id = index + '.' + subIndex;
          element.lastChild.setAttribute("onclick", 'javascript: removeStatement("' + index + '.' + subIndex++ + '")');
          element = document.getElementById('st' + index + '.' + (subIndex+1));
        }
        return false;
      }

      function findLastElements(number){
        var i = 0; var element;
        do{
          element = document.getElementById(++i + "");
        }while(element != null);
        if(i == 1){
          return 0;
        }
        else{
          return i-1;
        }
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
          last = findLastElements(number);
          if(last < number){ //Số câu hỏi cũ ít hơn số câu hỏi được yêu cầu
            if(last == 0){  //Chưa có câu hỏi nào

              var tag = document.getElementById("title");
              var s = "";

              for(i = 1; i <= number; i++){
                s += "<div class='Question' id='" + i + "'><div class='statement'>Câu " + i + ": " + "<textarea rows='2' cols='50'></textarea><input id='cb" + i + "' type='checkbox' style='margin-left:30px' value='multiple' onchange='replaceElements(" + i + ")' /> Cho phép chọn nhiều đáp án</div>"
                + "<div class='statement' id='st" + i + "." + 1 + "'><span id='" + i  + "." + 1 + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(\"" + i  + "." + 1 + "\")' width='20px'></div>"
                + "<div class='statement' id='st" + i + "." + 2 + "'><span id='" + i  + "." + 2 + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(\"" + i  + "." + 2 + "\")' width='20px'></div>"
                + "<div class='statement' id='st" + i + "." + 3 + "'><span id='" + i  + "." + 3 + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(\"" + i  + "." + 3 + "\")' width='20px'></div>"
                + "<div class='statement' id='st" + i + "." + 4 + "'><span id='" + i  + "." + 4 + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(\"" + i  + "." + 4 + "\")' width='20px'></div>"
                + "<div class='statement' id='bAdd" + i + "'><input type='image' src='resources/icon/plus.png' onclick='addElements(\"" + i + "\"); return false;' width='16px'> Thêm câu trả lời</div><br></div>";
              }

              s += "<input type='submit' value='Hoàn thành' style='padding:10px; border-radius: 20px' /><a href='' style='float:right'>Xoá hết câu hỏi</a>";

              tag.insertAdjacentHTML(
                "afterend",
                '<div id="set"><hr>' + s + '</div>'
              );
            }
            else{ 
              var tag = document.getElementById(last + "");
              var s = "";

              for(i = last+1; i <= number; i++){
                s += "<div class='Question' id='" + i + "'><div class='statement'>Câu " + i + ": " + "<textarea rows='2' cols='50'></textarea><input id='cb" + i + "' type='checkbox' style='margin-left:30px' value='multiple' onchange='replaceElements(" + i + ")' /> Cho phép chọn nhiều đáp án</div>"
                + "<div class='statement' id='st" + i + "." + 1 + "'><span id='" + i  + "." + 1 + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(\"" + i  + "." + 1 + "\")' width='20px'></div>"
                + "<div class='statement' id='st" + i + "." + 2 + "'><span id='" + i  + "." + 2 + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(\"" + i  + "." + 2 + "\")' width='20px'></div>"
                + "<div class='statement' id='st" + i + "." + 3 + "'><span id='" + i  + "." + 3 + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(\"" + i  + "." + 3 + "\")' width='20px'></div>"
                + "<div class='statement' id='st" + i + "." + 4 + "'><span id='" + i  + "." + 4 + "'><input type='radio' name='group" + i + "' /></span><textarea rows='1' cols='50'></textarea> <input type='image' src='resources/icon/cross.png' onclick='removeStatement(\"" + i  + "." + 4 + "\")' width='20px'></div>"
                + "<div class='statement' id='bAdd" + i + "'><input type='image' src='resources/icon/plus.png' onclick='addElements(\"" + i + "\"); return false;' width='16px'> Thêm câu trả lời</div><br></div>";
              }

              tag.insertAdjacentHTML(
                "afterend",
                s
              );
            }
          }
          else{   //Số câu hỏi cũ nhiều hơn hoặc bằng số câu hỏi được yêu cầu
            if(number == last) return;
            for(i = number+1; i <= last; i++){
              removeElements(i+"");
            }
          }
        }
      }

      function replaceElements(i){
        var multi=document.getElementById('cb' + i);
        var j = 1;
        if(multi.checked){
          var ele = document.getElementById(i + "." + j);
          while(ele != null){
            ele.innerHTML = "<input type='checkbox' />";     
            j++;
            ele = document.getElementById(i + "." + j);
          }    
        }else{
          var ele = document.getElementById(i + "." + j);
          while(ele != null){
            ele.innerHTML = "<input type='radio' name='group" + i + "' />";   
            j++;
            ele = document.getElementById(i + "." + j);
          }
        }
      }

    </script>
  </body>
</html>
