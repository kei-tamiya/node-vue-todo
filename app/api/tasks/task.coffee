Task = require('../../models/task.js')

exports.get = (req, res) ->
  Task.find (err, tasks) ->
    res.status(500).send({ error: err }) if err?
    res.status(200).send({ data: tasks })

exports.post = (req, res) ->
  t = new Task({
    title: req.body.title,
    completed: false
  })
  t.save (err, resource) ->
    res.status(500).send({ error: err }) if err?
    res.status(200).send(resource)