#Task = require('../../models/task.js')

vm = new Vue
  el: "#wrapTodosTest",
  created: ->
    this.$http.get('/api/todos/get')
      .then (response) ->
        this.todos = response.json().data
      ,(response) ->
        console.log response
  data: {
    newTask: "",
    todos: [
      {title: "test"}
    ]
  },

  methods: {
    add: ->
      t = {
        title: this.newTask,
        completed: false
      }
      console.log "ttttt : #{t}"
      this.newTask = ""
#      t.save (err, resource) ->
#        res.send(500, { error: err }) if err?
#        res.send(resource)
#      this.$http.post('mongodb://172.17.0.2:27017/tasks', t)
#        .then (res) ->
#          this.todos = res.data
#          console.log "res.data : #{res.data}",
#        (err) -> console.log err
  }
