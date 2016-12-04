#Task = require('../../models/task.js')

vm = new Vue
  el: "#wrapTodosTest",
  mounted: ->
    this.$http.get('/api/todos/get')
      .then (response) ->
        this.todos = response.body.data
      ,(response) ->
        console.log response
  data: {
    newTask: "",
    todos: undefined
  },

  methods: {
    add: ->
      t = {
        title: this.newTask,
        completed: false
      }
      this.$http.get('/api/todos/post', t)
        .then (response) ->
          this.todos = response.json().data
        ,(response) ->
          console.log response
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
