Task = require('../models/task.coffee')

exports.index = (req, res) ->
  Task.find (err, tasks) ->
    res.render "tasks/index", { tasks: tasks } if tasks?
