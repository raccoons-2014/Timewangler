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
            window.location.replace(response.url);
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

$(document).ready(function() {
  if ($('#match').length > 0) {
    console.log('matches loaded');
    checkMatch();
    window.onbeforeunload = function() { cancelMatch(); }
  };
})
