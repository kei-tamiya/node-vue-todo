mongoose = require('mongoose')
Schema = mongoose.Schema

Task = new Schema({
  title: String,
  completed: Boolean
})

# TODO 後でenvによって切り替えられるように書き換え
mongoose.connect('mongodb://172.17.0.2:27017/tasks')

module.exports = mongoose.model('Task', Task)
