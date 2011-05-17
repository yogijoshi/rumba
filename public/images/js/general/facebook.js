function login(){
	FB.login(function(response) {
	  if (response.session) {
	    if (response.perms) {
	      //email,user_location,read_stream,publish_stream,offline_access,manage_pages
//	      show_alert(FB.getSession().uid);
//	      show_alert(response.perms);
			window.location.href="fblogin";
	    } else {
//	      show_alert("No Permissions Granted");
	      window.location.href="fblogin";
	    }
	  } else {
	    show_alert("User Not Logged in on Facebook");
	  }
	}, {perms:'user_birthday,email,user_location,read_stream,publish_stream,offline_access,manage_pages'});
}

function logout(){
window.location.href="/dealtadka/businesses/logout";
//	FB.logout(function(response) {
//		
//});
}

