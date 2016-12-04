express = require('express')
app = express()
http = require('http').Server(app)
#router = express.Router()
logger = require('morgan')
path = require('path')
port = 8080
bodyParser = require('body-parser')

task_controllers = require('./app/controllers/task_controllers.js')

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

app.get '/todos/index', task_controllers.index

app.get '/todos/new', (req, res) ->
    res.render "todos/new"

#app.configuration ->
#  app.set 'storage-uri',
#    'mongodb://172.17.0.2:27017/todos'
#
#mongoose.connect app.get('storage-uri'), { db: { safe: true }}, (err) ->
#  console.log "Mongoose - connection error: " + err if err?
#  console.log "Mongoose - connection OK"


app.post '/todos/create', task_controllers.create

#  fields = req.body
#
#  t = new Todo(fields)
#  t.save (err, resource) ->
#    res.send(500, { error: err }) if err?
#    res.send(resource)
#  res.send "#{req.body.title} Created!"

app.get '/users/:id', (req, res) ->
  res.send "hello #{req.params.name} !"

#Todo.find({}, (err, docs) -> {
#  for key, doc of docs console.log "title: #{doc.title}"
#
#
#})

http.listen port, ->
  console.log "listening on *:", port