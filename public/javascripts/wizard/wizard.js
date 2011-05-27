/*--
#    Name    : wizard.js
#    Author  : Jerod Santo
#    Contact : "moc.liamg@otnas.dorej".reverse
#    Date    : 2008 August  9
#    About   : Provides wizard-esque web page for forms or whatever
#								To be used in conjunction with Cody Lindley's CSS Step Menu:
#								http://codylindley.com/CSS/325/css-step-menu
#							 Insipered by a similar implementation at:
#								http://worcesterwideweb.com/2007/06/04/jquery-wizard-plugin/
#--*/
$(document).ready(function(){

  // all content starts hidden
  $('.wizardcontent').hide();
	$('#wizardcontent').hide();
  // initialize the wizard state
  load_state(1);
  
  // loads new state based on button clicked
  $(':submit').click(function(){
		//reset the wizardcontent to hidden
		$('#wizardcontent').hide();
    var current_state = $('#wizard').attr('class');
    //we only want the number, converted to an int
    current_state = parseInt(current_state.replace(/(step_)/, ""));
		//figure out if 'next' or 'previous' was clicked and load appropriate state
    if ($(this).attr('id') == 'next'){ load_state(++current_state); }
    else if ($(this).attr('id') == 'previous'){ load_state(--current_state); }
  });
});

function loadnextstate(){
		//reset the wizardcontent to hidden
		$('#wizardcontent').hide();
    var current_state = $('#wizard').attr('class');
    //we only want the number, converted to an int
    current_state = parseInt(current_state.replace(/(step_)/, ""));
		//figure out if 'next' or 'previous' was clicked and load appropriate state
//    if ($(this).attr('id') == 'next')
		load_state(++current_state);
  }
 

  function loadpreviousstate(){
		//reset the wizardcontent to hidden
		$('#wizardcontent').hide();
    var current_state = $('#wizard').attr('class');
    //we only want the number, converted to an int
    current_state = parseInt(current_state.replace(/(step_)/, ""));
		//figure out if 'next' or 'previous' was clicked and load appropriate state
//    if ($(this).attr('id') == 'next')
		load_state(--current_state);
  }

  
function load_state(current_state){
	//disable all buttons while loading the state
	$('#previous').attr("disabled","disabled");
	$('#next').attr("disabled","disabled")
  //load the content for this state into the wizard content div and fade in
  var content = $('#step_' + current_state).html();
  $('#wizardcontent').html(content);
	$('#wizardcontent').fadeIn("slow");
  //set the wizard class to current state for next iteration
  $('#wizard').attr('class','step_'+ current_state);
  var iterator = 1;
  // the state heading h3. removing is no biggie
  $('#wizard h3').text("Step " + current_state);
  // loop through the list items and set classes for css coloring
  $('#mainNav li').each(function(){
		var step = $(this)
    if (iterator == current_state){ step.attr('class','current'); }
    else if (current_state - iterator == 1){ step.attr('class','lastDone'); }
    else if (current_state - iterator > 1){ step.attr('class','done'); }
    else{ step.attr('class',''); }
		// special case for step 5 because it doesn't have bacground image
		if (iterator == 4){ step.addClass('mainNavNoBg'); }
    iterator++;
  });
	//depending on the state, enable the correct buttons
	switch(current_state){
		case 1:
	  	$('#next').removeAttr("disabled");
			break;
		case 4:
			$('#previous').removeAttr("disabled");
			break;
		default:
			$('#previous').removeAttr("disabled");
			$('#next').removeAttr("disabled");
	}
}