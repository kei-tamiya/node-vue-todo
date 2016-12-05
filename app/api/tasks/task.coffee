Task = require('../../models/task.js')

exports.get = (req, res) ->
  Task.find (err, todos) ->
    res.status(500).send({ error: err }) if err?
    res.status(200).send({ data: todos })

exports.post = (req, res) ->
  console.log "reqqqq: #{req.body}"
  t = new Task({
    title: req.body.title,
    completed: false
  })
  t.save (err, resource) ->
    res.status(500).send({ error: err }) if err?
    res.status(200).send(resource)