var chart_line;
var chart_txt_title = "Deals Viewed (This Month)" ;
var chart_render_div = "dashboard_graph";
var chart_tool_tip = "<b>Deal Views </b><br/> " ;
var chart_y_axis = " " ;


var options_line = {
	chart : {
		renderTo : chart_render_div,
		marginRight : 10,
		zoomType : 'xy'
	},
	title : {
		text : chart_txt_title 
		
	},   


    yAxis : {
    
       title: {
        	      	  text : chart_y_axis         
              },
              showFirstLabel : false
	},
	tooltip : {
		crosshairs:
		
		{
		        width: 2,
		        color: 'gray',
		        dashStyle: 'shortdot' 
		
		},
		
		
		
		formatter : function() {
			return  chart_tool_tip + this.x + ' : ' + this.y ;
		}
	},

	 plotOptions: {
         line: {
            dataLabels: {
               enabled: true
            }
            //enableMouseTracking: false
			
         }
      },
      exporting: {
          enabled: true
      },
	credits : {
		enabled : false
	}
};



function dashboard(obj) {
	
	//alert(obj);
	var v_charttype , v_datatype , v_dealid ;
	
	v_dealid = $("#select_dealid_id").val();
	v_charttype = $("#select_charttype_id").val();
	v_datatype = $("input[@name=select_datatype_name]:checked").val();
	
// if variables are not set , then default graph this weeek deal views for all
// deals
	
   if (!v_charttype)
   {
      v_charttype = "TW" ;
   }
    if (!v_datatype)
   {
      v_datatype = "DV" ;
   }
    if (!v_dealid)
   {
        v_dealid = "*";
   } 
   
 // changing chart look and feel
   
   if (v_datatype == "DD")
   {
       options_line.title.text = "Deals Downloaded" ;
       chart_tool_tip = "<b>Deal Downloads</b><br/>" ;       
       options_line.yAxis.title.text = "Downloaded" ;
       
       
   }else if (v_datatype == "DR")
   {
       options_line.title.text = "Deals Redeemed" ;
       chart_tool_tip = "<b>Deal Redeems</b><br/>" ;       
       options_line.yAxis.title.text = "Redeemed" ;
       
       
   }else if (v_datatype == "DV")
   {
       options_line.title.text = "Deals Viewed " ;
       chart_tool_tip = "<b>Deal View</b><br/>" ;
       options_line.yAxis.title.text = "Views" ;
  
   }
    
// options_line.xAxis.title.text = "x axis " ;
//	switch(v_charttype)
//			{
//				case 'TD': 
//				    option_
//				    options_line.xAxis.title.text = "Today" ;
//					break;
//				case 'YD':
//				    options_line.xAxis.title.text = "Yesterday" ;
//					break;
//				case 'TW':				
//					break;
//				case 'TM':
//					break;
//				case 'LM':
//					break;
//				case 'TY':
//					break;
//				default :
//					break;	
//			}
   
    
   
// for testing
// alert(v_charttype+v_datatype+v_dealid);
    
    
/*
 * format for chart getChartData($datatype, $dealid, $charttype) datatype = DV /
 * DD dealid = Deal_id / (* - for all) charttype =
 * TD(Today)/YD(Yesterday)/TW(This week)/TM(This month)/LM(Last month)/TY(This
 * year)
 */   

	
	$.ajax({
				url : serverurl + 'charts/getChartData/',
				dataType : "json",
				data : {
					'charttype' : v_charttype,
					'datatype' : v_datatype,
					'dealid' : v_dealid
				},
				type : "POST",
				success : function(data) {
					var yarrAll = [];
					var xarrAll = [];
					var yarrFacebook = [];
					var xarrFacebook = [];
					var yarrMobile = [];
					var xarrMobile = [];
					var yarrEmail = [];
					var xarrEmail = [];

					
					if (data.alldata.xaxis != -1 && data.alldata.yaxis != -1) {
						$("#graphloader").hide();
						$("#vdselectors").show();

						for (var i in data.alldata.yaxis) 
						{
							yarrAll.push(data.alldata.yaxis[i]);
							xarrAll.push(data.alldata.xaxis[i]);
						}
						if(typeof data.facebookdata != 'undefined')
						{
							for (var i in data.facebookdata.yaxis) 
							{
								yarrFacebook.push(data.facebookdata.yaxis[i]);
								xarrFacebook.push(data.facebookdata.xaxis[i]);
							}
						}
						if(typeof data.mobiledata != 'undefined')
						{
							for (var i in data.mobiledata.yaxis) 
							{
								yarrMobile.push(data.mobiledata.yaxis[i]);
								xarrMobile.push(data.mobiledata.xaxis[i]);
							}
						}
						if(typeof data.emaildata != 'undefined')
						{

							for (var i in data.emaildata.yaxis) 
							{
								yarrEmail.push(data.emaildata.yaxis[i]);
								xarrEmail.push(data.emaildata.xaxis[i]);
							}
						}
 
						if(xarrAll.length >= 12)
						{
							if(typeof data.facebookdata != 'undefined')
							{
								
								options_line.series = [{
									name : 'All',
									data : yarrAll
								},{
									name : 'Facebook',
									data : yarrFacebook
								},{
									name : 'Mobile',
									data : yarrMobile
								}];

							}else if(typeof data.emaildata != 'undefined')
							{
								options_line.series = [{
									name : 'All',
									data : yarrAll
								},{
									name : 'Email',
									data : yarrEmail
								},{
									name : 'Mobile',
									data : yarrMobile
								}];
							}else
							{
								options_line.series = [{
									name : 'All',
									data : yarrAll
								}];
							}
							
							
							options_line.xAxis = {
								categories : xarrAll ,
								labels :
									{
								      rotation: -45,
								      step : 2
									}
						
							};
							
						}else
						{
							if(typeof data.facebookdata != 'undefined')
							{
								
								options_line.series = [{
									name : 'All',
									data : yarrAll
								},{
									name : 'Facebook',
									data : yarrFacebook
								},{
									name : 'Mobile',
									data : yarrMobile
								}];

							}else if(typeof data.emaildata != 'undefined')
							{
								options_line.series = [{
									name : 'All',
									data : yarrAll
								},{
									name : 'Email',
									data : yarrEmail
								},{
									name : 'Mobile',
									data : yarrMobile
								}];
							}else
							{
								options_line.series = [{
									name : 'All',
									data : yarrAll
								}];
							}
							
							options_line.xAxis = {
								categories : xarrAll
							};
						}

						chart_line = new Highcharts.Chart(options_line);
						chart_line.setSize(600, 230);

					} else {
						$("#graphloader").hide();
						$("#chartnotice").show();

					}

				}
			});
}