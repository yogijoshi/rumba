function show_alert(message){
	if(debug){
		alert(message);
	}
}

function initpopup(name){ 
	$('#'+name).jqm();
}

function showpopup(name){
	$('#'+name).jqmShow();
	
}

function hidepopup(name){
	$('#'+name).jqmHide();
}


function cropImage(id, fileName, responseJSON){
	$.ajax({
		url:"uploadtest/crop_image/"+fileName,
		success:function(response){
			
			$("#modalWin").html(response);
			initpopup("modalWin");
			showpopup("modalWin");
			
		}
	});
	
}

function more(created_time){
		$("#earlieractivityloader").show();
		data={
				'time':created_time
			};
	    $.ajax({
  		  type: "POST",
            url: serverurl+'mc/home/more',
            dataType:'html',
            data:data,
            success: morecallback
          });
}

function morecallback(data){
	$("#earlieractivityloader").hide();
	$("#moreactivity").remove();
	$("#mainactivity").append(data);
}


function sendspecialdeal(){
	initpopup("spdeal");
	showpopup("spdeal");
}

function facebookfeedpopup_show(){
	initpopup("feedPopup");
	showpopup("feedPopup");
}

function facebookfeedpopup_hide(){
	hidepopup("feedPopup");
}