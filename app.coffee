app = require('express')()
http = require('http').Server(app)
port = 8080

app.get '/', (req, res) ->
  res.send "hello world"

http.listen port, ->
  console.log "listening on *:", port