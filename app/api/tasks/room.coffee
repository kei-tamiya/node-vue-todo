Room = require('../../models/room.coffee')

exports.get = (req, res) ->
  Room.find (err, rooms) ->
    res.status(500).send({ error: err }) if err?
    res.status(200).send({ data: rooms })

exports.post = (req, res) ->
  r = new Room({
    name: req.body.name,
  })
  r.save (err, resource) ->
    res.status(500).send({ error: err }) if err?
    res.status(200).send(resource)

exports.delete = (req, res) ->
  Room.remove { _id: req.params.id }, (err, resource) ->
    res.status(500).send({ error: err }) if err?
    res.status(200).send(resource)
