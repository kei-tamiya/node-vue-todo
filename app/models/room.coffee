mongoose = require('mongoose')
Schema = mongoose.Schema

Room = new Schema {
  name: String
}

module.exports = mongoose.model('Room', Room)