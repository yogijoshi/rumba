var temp_deal_id="";

function deals(deal_id,func,type)
{
	var data;
	switch(type)
	{
	case 'duplicate':
		data={
				'dealid':deal_id,
				'userid':user_id
			};
	    $.ajax({
  		  type: "POST",
            url: serverurl+'mc/deals/duplicateDeal',
            dataType:'json',
            data:data,
            success: func
          });
		break;
		//updateDeleteDealView
	case 'delete':
		var reply = confirm("Do you really want to delete this deal?\nNote: All the Information releted to this deal will be deleted from system as well as from Facebook.");
		if(reply==true)
		{
			data={
			'dealid':deal_id
			};
		    $.ajax({
				  type: "POST",
		        url: serverurl+'mc/deals/deleteDeal',
		        dataType:'json',
		        data:data,
		        success: func
		      });
		}
		break;
	case 'stop':
		var reply = confirm("Do you really want to Stop this deal?");
		if(reply==true)
		{
			data={
				'dealid':deal_id,
				'userid':user_id
			};
		    $.ajax({
				  type: "POST",
		        url: serverurl+'mc/deals/stopDeal',
		        dataType:'json',
		        data:data,
		        success: func
		      });
		}
		break;
	case 'archive':
		break;
	}
}

function updateStopDealView(data)
{
	alert(data.returnText);
	document.location.reload();
}
function updateDeleteDealView(data)
{
	alert(data.returnText);
	document.location.reload();
}

function updateDuplicateDealView(data)
{
	alert(data.returnText);
	document.location.reload();
}

function shareonfanpage(deal_id){
	temp_deal_id=deal_id;
	facebookfeedpopup_show();
}

function publishtofacebook(){
	var feed_text=$("#feedtext").val();
	var data={'deal_id':temp_deal_id,
		'feed_text':feed_text
	};

	$.ajax({
  		  type: "POST",
            url: serverurl+'test/feedtest',
            dataType:'text',
            data:data,
            success: function(obj){
            	facebookfeedpopup_hide();
            	alert(obj);
    			window.location.reload();        	
            }
          });
}

function makeDealActive(){
	toggle('facebook');
	$("#activate_deal_button").hide();
	$("#create_deal_loader").show();
	$.ajax({
		  type: "POST",
          url: serverurl+'mc/deals/active',
          dataType:'text',
          success: function(obj){
        	  	alert(obj);
        	  	$("#create_deal_loader").hide();
        		$("#deal_published_box").show();
//		  		window.location.reload();        	
          }
        });
}

function hovereffecton(dealid,color,reason){
	$("#"+dealid+"_action").removeClass("sprite-blue_"+reason);
	$("#"+dealid+"_action").addClass("sprite-"+color+"_"+reason);
}

function hovereffectoff(dealid,color,reason){
	$("#"+dealid+"_action").addClass("sprite-blue_"+reason);
	$("#"+dealid+"_action").removeClass("sprite-"+color+"_"+reason);
}

function changeall(){
		$("#filterall").removeClass("bluelink");
		$("#filterlive").removeClass("bluelink");
		$("#filterdraft").removeClass("bluelink");
		$("#filterover").removeClass("bluelink");
		
		$("#filterall").removeClass("current_all_deals_menu");
		$("#filterlive").removeClass("current_all_deals_menu");
		$("#filterdraft").removeClass("current_all_deals_menu");
		$("#filterover").removeClass("current_all_deals_menu");
}

function filterdeals(obj){
	
	switch(obj){
		case "all":{
			changeall();
						$("#mydealrightcorner").addClass("gtr");
			$("#filterall").addClass("current_all_deals_menu");
			$("#filterlive").addClass("bluelink");
			$("#filterdraft").addClass("bluelink");
			$("#filterover").addClass("bluelink");			

			$(".active").show();
			$(".draft").show();
			$(".draftic").show();
			$(".over").show();
			break;
		}
		case "live":{
			changeall();
						$("#mydealrightcorner").addClass("gtr");
			$("#filterall").addClass("bluelink");
			$("#filterlive").addClass("current_all_deals_menu");
			$("#filterdraft").addClass("bluelink");
			$("#filterover").addClass("bluelink");			
			
			$(".active").show();
			$(".draft").hide();
			$(".draftic").hide();
			$(".over").hide();
			break;
		}
		case "draft":{
			changeall();
			$("#mydealrightcorner").addClass("gtr");
			$("#filterall").addClass("bluelink");
			$("#filterlive").addClass("bluelink");
			$("#filterdraft").addClass("current_all_deals_menu");
			$("#filterover").addClass("bluelink");			
			
			$(".active").hide();
			$(".draft").show();
			$(".draftic").show();
			$(".over").hide();
			break;
		}
		case "over":{
			changeall();
			$("#mydealrightcorner").removeClass("gtr");
			$("#filterall").addClass("bluelink");
			$("#filterlive").addClass("bluelink");
			$("#filterdraft").addClass("bluelink");
			$("#filterover").addClass("current_all_deals_menu");
			$(".active").hide();
			$(".draft").hide();
			$(".draftic").hide();
			$(".over").show();
			break;
		}
	}
}