var request = new XMLHttpRequest();
request.onload = callback;
request.open("post", "http://localhost:3000/request");
request.setRequestHeader("Content-Type", "application/json");
request.send('{"my_data":"back to basics"}');
