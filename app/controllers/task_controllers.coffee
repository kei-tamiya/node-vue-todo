Task = require('../models/task.coffee')

exports.index = (req, res) ->
  Task.find (err, tasks) ->
    res.render "tasks/index", { tasks: tasks } if tasks?

exports.create = (req, res) ->
  t = new Task({
    title: req.body.title,
    completed: false
  })
  t.save (err, resource) ->
    res.send(500, { error: err }) if err?
    res.send(resource)