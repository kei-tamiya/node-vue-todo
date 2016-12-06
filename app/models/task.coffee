mongoose = require('mongoose')
Schema = mongoose.Schema

Task = new Schema({
  room_id: Number,
  title: String,
  completed: Boolean
})

module.exports = mongoose.model('Task', Task)
