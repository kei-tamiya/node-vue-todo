Room = require('../models/room.coffee')

exports.index = (req, res) ->
  Room.find (err, rooms) ->
    res.render 'rooms/index', { rooms: rooms } if rooms?