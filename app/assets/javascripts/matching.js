// Gets the GameId number from the URL and returns it.
function getGameId() {
  var fullUrl = document.URL;
  var urlArray = fullUrl.split('/');
  return urlArray[4];
}

// Checks to see if anyone has joined the match, logs in the console while waiting for a response
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
                clearInterval(matchTimer);
                $('body').html(response);
                // Poll the server, located in game.js
                pollServer();
                // set up listener for card clicks
                cardInput();
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

// If a user has been searching too long (60 seconds), redirects to the profile path.
function matchTimeout(numSeconds) {
  var counter = 0;

  matchTimer = setInterval(function() {
                 counter ++;
                 if (counter > numSeconds) {
                   window.location.replace('/profile');
                 }
               }, 1000)
}
