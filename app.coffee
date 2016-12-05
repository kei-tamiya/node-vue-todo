express = require('express')
app = express()
http = require('http').Server(app)
logger = require('morgan')
path = require('path')
port = 8080
bodyParser = require('body-parser')

require('dotenv').config()

task_controllers = require('./app/controllers/task_controllers.js')
api_task = require('./app/api/tasks/task.js')

app.use bodyParser.json()
app.use bodyParser.urlencoded({extended: true})
app.set 'views', path.join(__dirname, '/app/views')
app.engine 'html', require('pug').renderFile
app.set 'view engine', 'pug'
app.use logger('dev')
app.use express.static(path.join(__dirname, '/public'))

app.param 'id', (req, res, next, id) ->
  users = ["tanaka", "saitou", "yoshida"]
  req.params.name = users[id]
  next()

app.get '/', (req, res) ->
  res.send "hello world"

app.get '/tasks/index', task_controllers.index

app.get '/tasks/new', (req, res) ->
    res.render "tasks/new"

app.get '/api/tasks/get', api_task.get
app.post '/api/tasks/post', api_task.post
app.patch '/api/tasks/update', api_task.update

app.post '/tasks/create', task_controllers.create
app.get '/users/:id', (req, res) ->
  res.send "hello #{req.params.name} !"

http.listen process.env.PORT || port, ->
  console.log "listening on *:", port