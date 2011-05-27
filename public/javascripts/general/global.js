function show_popup(){
	$(".popup_input_box").val("");
	initpopup('facebox');
	showpopup('facebox');
}

function close_popup(){
	hidepopup('facebox');
}
function toggle_sms(){
	$(".popup_sms_details").show();
	$(".popup_email_details").hide();
}

function toggle_email(){
	$(".popup_email_details").show();
	$(".popup_sms_details").hide();
}