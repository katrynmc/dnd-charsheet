var express = require('express')

var app = express()

var FAKE_STORE_INIT = {}
var FAKE_STORE = FAKE_STORE_INIT;


app.use(express.static('client/public'))


app.get('/store', function(req, res) {
  res.send(FAKE_STORE)
})


app.get('/:username', function(req, res) {
  res.status(200).send({
    userName: req.params.username
  })
});

app.post('/:username', function (req, res) {
  FAKE_STORE = req.body;
  res.status(201).send(FAKE_STORE)
})

app.put('/:username', function (req, res) {
  FAKE_STORE = req.body;
  res.status(200).send(FAKE_STORE)
})

app.delete('/:username', function (req, res) {
  FAKE_STORE = FAKE_STORE_INIT;
  res.status(200).send(FAKE_STORE)
})


app.get('/', function(req, res) {
  res.status(200).send(FAKE_STORE)
});


app.use(function (req, res, next) {
  res.status(404).send("404 i ded")
})


var server = app.listen(3000, function() {
  console.log('dnd server running at http://localhost:' + server.address().port);
});
