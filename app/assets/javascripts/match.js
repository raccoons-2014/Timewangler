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
              match.directToGame();
          });
        } else {
          match.listenForConfirmation();
        }
    });
  }
}

Match.prototype.cancel = function() {
  var match = this;

  $.ajax({
    url: "/games/" + match.id,
    method: "DELETE"
  })
}

Match.prototype.directToGame = function() {
  window['onbeforeunload'] = undefined;
  window.location.href = '/games/' + this.id.toString();
}

Match.prototype.timeout = function(numSeconds) {
  var counter = 0;

  matchTimer = setInterval(function() {
                 counter ++;
                 if (counter > numSeconds) {
                   window.location.replace('/profile');
                 }
               }, 1000)
}