function getGameId() {
  var fullUrl = document.URL;
  var urlArray = fullUrl.split('/');
  return urlArray[4];
}

function checkMatch() {
  setTimeout(function() {
    console.log("Waiting for another player to join...");

    $.ajax({
        url: "/games/" + getGameId() + "/status",
        method: "GET",
        dataType: "JSON",
        success: function(response) {
          console.log(response);
          if (response) {

            $.ajax({
              url: response.url,
              method: "GET",
              success: function(response) {
                window['onbeforeunload'] = undefined;
                $('body').html(response);
              }
            })
          } else {
            checkMatch();
          }
        },
        error: function(response) {
          console.log("ERROR:");
          console.log(response);
        }
      });

  }, 500)
}

function cancelMatch() {
  $.ajax({
    url: "/games/" + getGameId(),
    method: "DELETE"
  })
}

function matchTimeout(numSeconds) {
  var counter = 0;

  setInterval(function() {
    counter ++;
    if (counter > numSeconds) {
      window.location.replace('/profile');
    }
  }, 1000)
}

$(document).ready(function() {
  if ($('#match').length > 0) {
    console.log('matches loaded');
    matchTimeout(60);
    checkMatch();
    window.onbeforeunload = function() { cancelMatch(); }
  };
})
