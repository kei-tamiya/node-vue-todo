mongoose = require('mongoose')
Schema = mongoose.Schema

Task = new Schema({
  title: String,
  completed: Boolean
})

module.exports = mongoose.model('Task', Task)
