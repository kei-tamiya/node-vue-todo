mongoose = require('mongoose')
Schema = mongoose.Schema

Task = new Schema({
  room_id: String,
  title: String,
  completed: Boolean
})

module.exports = mongoose.model('Task', Task)
