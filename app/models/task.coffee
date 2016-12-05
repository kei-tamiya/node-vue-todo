mongoose = require('mongoose')
Schema = mongoose.Schema

Task = new Schema({
  title: String,
  completed: Boolean
})

# TODO 後でenvによって切り替えられるように書き換え
mongoose.connect(process.env.MONGOLAB_URI)

module.exports = mongoose.model('Task', Task)
