Room = require('../models/room.coffee')

exports.index = (req, res) ->
  Room.find (err, rooms) ->
    res.render 'rooms/index', { rooms: rooms, test : "testteste" } if rooms?

exports.show = (req, res) ->
  res.render 'rooms/show', { room_id: req.params.id }