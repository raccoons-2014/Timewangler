// Gets the GameId number from the URL and returns it.
function getGameId() {
  var fullUrl = document.URL;
  var urlArray = fullUrl.split('/');
  return urlArray[4];
}

function Match(id) {
  var self = this;
  window.onbeforeunload = function() { self.cancel() }
  this.id = id;
}

Match.prototype.listenForConfirmation = function() {
  var match = this;
  setTimeout(function() { checkServer() }, 500);

  function checkServer() {
    console.log("Waiting for another player to join...");

    $.ajax({
        url: "/games/" + match.id + "/status",
        method: "GET",
        dataType: "JSON"
      }).done(function(response) {
        console.log(response);

        if (response) {
          $.ajax({
            url: response.url,
            method: "GET"}).done(function(response) {
              clearInterval(matchTimer);
              window.location.href = '/games/' + match.id.toString();
          });
        } else {
          match.listenForConnection();
        }
    });
  }
}
