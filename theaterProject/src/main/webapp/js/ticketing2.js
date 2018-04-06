
var rowsname = '';
var makeTag = '', i = 1,j =1, leng = 0;
var RESULT = new Array();
//좌석 생성
var createSeat = function(colsNum, rowsNum){
	check = 0;
	$.ajax({
		url:"getTicketSeat.do" ,
		Type : "post",  
		async   : false,
		data: {
			"id" : scheduleID,
			"auditoriumId" : auditoriumID
		},
		success:function(args){
			for(var k = 0; k <= rowsNum; k++){
				RESULT.splice(0,RESULT.length);
				if(k == 0){
					makeTag += "<a href=\"#\" class=\"col\">X</a> "
				}else{
					makeTag += "<a href=\"#\" class=\"col\">"+ k +"</a> "
				}
			}
				makeTag += "<br/>"
			if(Object.keys(args).length != 0){
				for(i = 1; i<= colsNum; i++){
					rowsname = String.fromCharCode((64 + i)); 
					makeTag += "<a href=\"#\" class=\"col\">"+rowsname+"</a> "
					for(j = 1; j <= rowsNum; j++){
						if(args[check].locX == i && args[check].locY == j){
							makeTag += "<a href=\"#\" class=\"toggler none\">0</a> ";
							checkList(args);
						}else{
							makeTag += "<a href=\"#\" class=\"toggler\" id = \"\ "+ j+rowsname+ "\"\>1</a>  ";
						}
					}
					makeTag += "<br/>"
				}
			}
			//만약 예약이 1이라도 안되어있을경우 모든칸을 흰색칸으로처리
			else{
				for(i = 1; i<= colsNum; i++){
					rowsname = String.fromCharCode((64 + i));
					makeTag += "<a href=\"#\" class=\"col\">"+rowsname+"</a> "
					for(j = 1; j <= rowsNum; j++){
						makeTag += "<a href=\"#\" class=\"toggler\" id = \"\ " +j+rowsname+ " \"\>1</a>  ";
					}
					makeTag += "<br/>";	
				}	
			}
		}
	})
	
	/*
	 *  예약되어있는 칸이 여러개일경우 
	 *  리스트총 갯수까지 check를 늘려
	 *  모든 리스트를 처리할수 있는 기능
	 *  ex) list의 총 갯수가 2개일 때,
	 *  list[0]이 처리되었으면, 이 메소드가 실행되어
	 *  list[1]이 되고, list[1]이 처리되면 그상태를 유지함.
	 */
	 
	function checkList(args){
		if(check != Object.keys(args).length-1){
			check++;
		}
	}
};



var updateView = function() {
	document.all("seat").innerHTML = null;
	makeTag = '';	
	createSeat(colsNum, rowsNum);
	document.all("seat").innerHTML = makeTag;
	checkSeat();
	};

function checkSeat(){
	$('a.toggler').click(function(){

		if($(this).attr('class') == 'toggler'){
	       RESULT.push(this.id);
		}else{
			for(var a = 0; a < RESULT.length; a++){
				if(RESULT[a] == this.id){
					RESULT.splice(a,1);
				}
			}
		}
       $(this).toggleClass('off');
	});
	
	$('a.toggler none').click(function(){
		alert('이미 예약되어있는 좌석입니다.');
	});
}

$(document).ready(function() {
	$("#setResult").submit(function(){
		$('#result').val(RESULT);
		$('#schID').val(scheduleID);
		$('#auditoriumID').val(auditoriumID);
	})
	
	 $(".cancel").click(function(){
		 modal.style.display = "none"; 
	 });
});


