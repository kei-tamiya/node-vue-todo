Room = require('../models/room.coffee')
Task = require('../models/task.coffee')

exports.index = (req, res) ->
  Room.find (err, rooms) ->
    res.render 'rooms/index', { rooms: rooms } if rooms?

exports.show = (req, res) ->
  Task.find {}, (err, tasks) ->
    res.rend r "rooms/show", { tasks: tasks, room_id: req.params.id } if tasks?
