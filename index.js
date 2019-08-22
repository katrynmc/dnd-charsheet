var express = require('express')

var app = express()

var FAKE_STORE_INIT = []
var FAKE_STORE = FAKE_STORE_INIT;


function updateRecord(newCharSheet) {
  return removeRecord(newCharSheet).concat(newCharSheet);
}

function removeRecord(newCharSheet) {
  return FAKE_STORE.filter(function (sheet) {
    return sheet.userName !== newCharSheet.userName
  });
}

app.use(express.static('client/public'))


app.get('/store', function(req, res) {
  res.send(FAKE_STORE)
})


app.get('/:username', function(req, res) {
  var foundSheet = FAKE_STORE.find(function (sheet) {
    return sheet.userName === req.params.username;
  });

  if (foundSheet) {
    return res.status(200).send({
      userName: req.params.username
    });
  }
  else {
    return res.status(404).send({
      message: "No record found for this user"
    });
  }
});

app.post('/:username', function (req, res) {
  var newSheet = req.body;
  FAKE_STORE = updateRecord(req.body);
  res.status(201).send(newSheet)
})

app.put('/:username', function (req, res) {
  var newSheet = req.body;
  FAKE_STORE = updateRecord(req.body);
  res.status(200).send(newSheet);
})

app.delete('/:username', function (req, res) {
  FAKE_STORE = removeRecord(req.body);
  res.status(200).send();
})


app.get('/', function(req, res) {
  res.status(200).send();
});


app.use(function (req, res, next) {
  res.status(404).send({ message: "this route doesn't exist i ded" })
})


var server = app.listen(3000, function() {
  console.log('dnd server running at http://localhost:' + server.address().port);
});
