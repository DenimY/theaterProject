<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/custom.css">
<title>Theater</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
   var buf = "";
   var webSocket = new WebSocket('ws://192.168.0.53/broadcasting');
   webSocket.onerror = function(event) {
      onError(event)
   };
   webSocket.onopen = function(event) {
      onOpen(event)
   };
   webSocket.onmessage = function(event) {
      onMessage(event)
   };

   function onMessage(event) {
      var parsed = JSON.parse(event.data);
      var text = parsed.name + " : " + parsed.message;
      $('#chatList').append(
                  '<div class="row">'
                  + '<div class="col-lg-12">'
                  + '<div class="media">'
                  + '<a class="pull-left" href="#">'
                  + '<img class="media-object img-circle" src="resources/image/icon.png" alt="">'
                  + '</a>' + '<div class="media-body">'
                  + '<h4 class="media-heading">' + parsed.name
                  + '<span class="small pull-right">' + parsed.time
                  + '</span>' + '</h4>' + '<pre>' + parsed.message
                  + '</pre>' + '</div>' + '</div>' + '</div>'
                  + '</div>' + '<hr>');
      $('#chatList').scrollTop($('#chatList')[0].scrollHeight);
   }

   function onOpen(event) {
   }

   function onError(event) {
//       alert(event.data);
   }

   function send() {
      var inputMessage = $("#inputMessage");
      var inputName = $("#inputName");
      var today = new Date();
      buf = ""
//       buf += (today.getYear()+1900) + "-" + (today.getMonth() + 1) + "-" + today.getDate() + " ";
      
      buf += (today.getYear()+1900) + "-";
      
      if((today.getMonth()+1)<10) {         
         buf += "0" + (today.getMonth() + 1) + "-";
         
      } else {         
         buf += (today.getMonth() + 1) + "-";
      }
      
      if(today.getDate()<10) {         
         buf += "0" + today.getDate() + " ";
      } else {         
         buf += today.getDate() + " ";
      }
      
      if(today.getHours()>=12) {
         if ((today.getHours()-12) < 10)
            buf += "오후 0" + (today.getHours()-12) + ":";
         else
            buf += "오후 " + (today.getHours()-12) + ":";   
      } else {
         if (today.getHours() < 10)
            buf += "오전 0" + today.getHours() + ":";
         else
            buf += "오전 " + today.getHours() + ":";
      }
      if (today.getMinutes() < 10) {
         buf += "0" + today.getMinutes();
      } else 
         buf += today.getMinutes();
      if (inputMessage.val()=="") {
         alert("이름과 메세지를 확인해주세요.")
      } else {
         $('#chatList').append(
               '<div class="row">'
               + '<div class="col-lg-12">'
               + '<div class="media">'
               + '<a class="pull-left" href="#">'
               + '<img class="media-object img-circle" src="resources/image/icon.png" alt="">'
               + '</a>' + '<div class="media-body">'
               + '<h4 class="media-heading">' + inputName.val() 
               + '<span class="small pull-right">' + buf
               + '</span>' + '</h4>' + '<pre>' + inputMessage.val()
               + '</pre>' + '</div>' + '</div>' + '</div>'
               + '</div>' + '<hr>');
         $('#chatList').scrollTop($('#chatList')[0].scrollHeight);   
         sendData = {
               'name' : inputName.val(),
               'message' : inputMessage.val(),
               'time' : buf
         };
         var sendText = JSON.stringify(sendData);
         webSocket.send(sendText);
         $("#inputMessage").val("");
      }
   }
</script>

    <style>
   .chatbtn {
      width:80px;
      height:80px;
       background: #93CE95;
       cursor: pointer;
       padding: 0 5px;
       border-radius: 5px;
       border-radius: 5px;
       text-decoration: none;
       transition: all .5s ease;
   }

</style>
</head>
<body>
   <div class="container">
      <div class="container bootstrap snippet">
         <div class="row">
            <div class="col-xs-12">
               <div class="portlet portlet-default">
                  <div class="portlet-heading">
                     <div class="portlet-title">
                        <h4>
                           <i class="fa fa-circle text-green"></i>Theater
                        </h4>
                     </div>
                     <div class="clearfix"></div>
                  </div>
                  <div id="chat" class="panel-collapse collapse in">
                     <div id="chatList" class="portlet-body chat-widget"
                        style="overflow-y: auto; width: auto; height: 600px;"></div>
                     <div class="portlet-footer">
                        <!-- 입력하는 부분 -->
                           <input style="height: 40px;" id="inputName"
                              class="form-control" placeholder="이름" maxlength="8"><br>
                              
                           <input style="height: 80px;" id="inputMessage"
                              class="form-control" placeholder="메세지를 입력하세요."
                              maxlength="100"></input>
                              
                        
                        <div style="float:right">
                           <button class="chatbtn" onclick="send()">전송</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>