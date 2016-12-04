Task = require('../models/task.js')

exports.index = (req, res) ->
  Task.find (err, todos) ->
    res.render "todos/index", {todos: todos} if todos?

exports.create = (req, res) ->
  t = new Task({
    title: req.body.title,
    completed: false
  })
  t.save (err, resource) ->
    res.send(500, { error: err }) if err?
    res.send(resource)