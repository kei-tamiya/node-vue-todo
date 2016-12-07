Task = require('../../models/task.coffee')

exports.get = (req, res) ->
  Task.find (err, tasks) ->
    res.status(500).send({ error: err }) if err?
    res.status(200).send({ data: tasks })

exports.post = (req, res) ->
  b = req.body
  t = new Task({
    room_id: b.room_id,
    title: b.title,
    completed: false
  })
  t.save (err, resource) ->
    res.status(500).send({ error: err }) if err?
    res.status(200).send(resource)

exports.update = (req, res) ->
  t = req.body.body
  Task.update { _id: t._id }, { $set: { title: t.title, completed: t.completed } }, (err, resource) ->
    res.status(500).send({ error: err }) if err?
    res.status(200).send(resource)

exports.delete = (req, res) ->
  Task.remove { _id: req.body._id }, (err, resource) ->
    res.status(500).send({ error: err }) if err?
    res.status(200).send(resource)