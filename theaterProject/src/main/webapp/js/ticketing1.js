	var modal = document.getElementById('myModal');
	var btn = document.getElementById("myBtn");
	var span = document.getElementsByClassName("close")[0];
	var auditoriumID = '',
		scheduleID = '';
	var colsNum = 0;
	var rowsNum = 0;
	var selectSeat;
	
function clickEventSCH(){
	$(".schedule_id").click(function() {

		var id = auditoriumID;
		scheduleID = this.id;
			$.ajax({
				url:"selectSeat.do",
				Type : "post",
				data: {
					"id" : id,
				},
				success:function(args){
					modal.style.display = "block";
					colsNum = args[Object.keys(args).length-1].locX;
					rowsNum = args[Object.keys(args).length-1].locY;

					updateView();
					return false;		
				},
				error : function(error) {
					console.log(error);
					alert("Error!");
				}
			})
	});
}

function clickEventADT(){
	$(".auditorium_id").click(function() {
		var id = this.id;
		auditoriumID = id;
		var title = $('#title').val();
		$.ajax({
			url:"selectAdt.do",
			Type : "post",
			data: {
				"id" : id,
				"title" : title
			},
			success:function(args){
				var sch = "";
				sch += "<div class=\"alert alert-success\">시간<br /><br />";
				for(var idx=0; idx<Object.keys(args).length; idx++) {
					sch += "<button type=\"button\" class = \"btn btn-info schedule_id\" id = "+ args[idx].id +">"+args[idx].time+"</button>  ";
				}
				sch += "</div>";
				document.all("schedule").innerHTML = sch;
				clickEventSCH();
			},
			error : function(error) {
				console.log(error);
				alert("Error!");
			}
		})
	});
}

window.onload = function() {
	$(".theater_id").click(function() { 

		var id = this.id,
		adt = "";
		
		$.ajax({
			url:"selectTheater.do",
			Type : "post",
			data: {
				"id" : id,
			},
			success:function(args){
				document.all("schedule").innerHTML =null;
				adt += "<h3>상영관</h3></br>";
				for(var idx=0; idx<Object.keys(args).length; idx++) {
//					$("#adt_id").append("<option value='"+args[idx].id+"'>"+args[idx].id + "관"+"</option>");
//					<button type="button" class="btn btn-dufault theater_id" id="${theater.name}">${theater.name} </button>
					adt += "<button type =\"button\" class = \"btn btn-dufault auditorium_id\" id="+ args[idx].id +">"+
					args[idx].id + "관 </button> " ;
				}
				adt += "<hr> </br>";
				document.all("auditorium").innerHTML = adt;
				clickEventADT();
			},
			error : function(error) {
				console.log(error);
				alert("Error!");
			}
		})
	});




	
	$(".modalContent > button").click(function(){
		modalLayer.fadeOut("slow");
		modalLink.focus();
	});	

	$('.modalLayer').on('hidden.bs.modal', function () {
		$(this).removeData('modalContent');
	});

//	<!-- 모달창 -->

		span.onclick = function() {
		    modal.style.display = "none";
		}

		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
}

