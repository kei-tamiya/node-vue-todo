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

app.use bodyParser.json()
app.use bodyParser.urlencoded({ extended: true })
app.set 'views', path.join(__dirname, '/app/views')
app.engine 'html', require('pug').renderFile
app.set 'view engine', 'pug'
app.use logger('dev')
app.use express.static(path.join(__dirname, '/public'))
app.use '/', router.room
app.use '/api', router.api

app.use errorHandler.logErrors
app.use errorHandler.errorHandler
app.use errorHandler.notFoundErrorHandler

server = http.createServer(app)
server.listen process.env.PORT || port, ->
  console.log "listening on *:", port
