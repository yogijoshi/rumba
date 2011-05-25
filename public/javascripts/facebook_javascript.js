
  function check_login_status()
  {
    alert("Hi");
    FB.getLoginStatus(function(response) {
      if (response.session) {
        if (response.perms) {
          // logged in and connected user, someone you know
          window.location.href="facebookinfo/index";
        }
      }
      else
      {
        FB.login(function(response) {
          if (response.session) {
            if (response.perms) {
              window.location.href="/facebookinfo/index";
            }
            else {
              alert("No permission");
            }
          }else {
            alert("No Login");
          }
        }, {perms:'read_stream,publish_stream,offline_access,manage_pages'});
      }
    });
  }

  
