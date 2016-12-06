express = require('express')
app = express()
http = require('http').Server(app)
logger = require('morgan')
path = require('path')
router = require('./config/router.coffee')
port = 8080
bodyParser = require('body-parser')
mongoose = require('mongoose')
mongoose.connect(process.env.MONGODB_URI)

app.use bodyParser.json()
app.use bodyParser.urlencoded({ extended: true })
app.set 'views', path.join(__dirname, '/app/views')
app.engine 'html', require('pug').renderFile
app.set 'view engine', 'pug'
app.use logger('dev')
app.use express.static(path.join(__dirname, '/public'))
app.use('/', router)

http.listen process.env.PORT || port, ->
  console.log "listening on *:", port
