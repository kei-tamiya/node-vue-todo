express = require('express')
http = require('http')
logger = require('morgan')
path = require('path')
port = 8080
bodyParser = require('body-parser')
router = require('./routes')
mongoose = require('mongoose')
mongoose.connect(process.env.MONGODB_URI)
errorHandler = require('./config/middlewares/errorHandler.coffee')

app = express()
io = require('socket.io')(http);
server = http.createServer(app)
io = require('socket.io').listen(server)

app.use bodyParser.json()
app.use bodyParser.urlencoded({ extended: true })
app.set 'views', path.join(__dirname, '/app/views')
app.engine 'html', require('pug').renderFile
app.set 'view engine', 'pug'
app.use logger('dev')
app.use express.static(path.join(__dirname, '/public'))
app.use '/', router.room
app.use '/api', router.api
io.on 'connection', (socket) ->
  socket.on 'addTask', (task) ->
    io.emit 'addTask', task

  socket.on 'toggleComplete', (data) ->
    io.emit 'toggleComplete', data

  socket.on 'updateTitle', (data) ->
    io.emit 'updateTitle', data

  socket.on 'deleteTask', (index) ->
    io.emit 'deleteTask', index

app.use errorHandler.logErrors
app.use errorHandler.errorHandler
app.use errorHandler.notFoundErrorHandler

server.listen process.env.PORT || port, ->
  console.log "listening on *:", port
