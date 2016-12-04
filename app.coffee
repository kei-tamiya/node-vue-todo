express = require('express')
app = express()
http = require('http').Server(app)
#router = express.Router()
logger = require('morgan')
path = require('path')
port = 8080
bodyParser = require('body-parser')

app.use bodyParser.json()
app.use bodyParser.urlencoded({extended: true})
app.set 'views', path.join(__dirname, '/app/views')
app.engine 'html', require('pug').renderFile
app.set 'view engine', 'pug'
app.use logger('dev')
app.use express.static "#{__dirname}/public"

app.param 'id', (req, res, next, id) ->
  users = ["tanaka", "saitou", "yoshida"]
  req.params.name = users[id]
  next()

app.get '/', (req, res) ->
  res.send "hello world"

app.get '/todos/new', (req, res) ->
  res.render "new"

app.post '/todos/create', (req, res) ->
  res.send "#{req.body.title} Created!"

app.get '/users/:id', (req, res) ->
  res.send "hello #{req.params.name} !"

http.listen port, ->
  console.log "listening on *:", port