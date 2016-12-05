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
    todos: []
  },
  methods: {
    add: ->
      nt = this.newTask.trim()
      if (!nt) then return
      t = {
        title: nt,
        completed: false
      }
      this.$http.post('/api/todos/post', t)
        .then (response) ->
          this.todos.push(response.body)
        ,(response) ->
          console.log response
      this.newTask = ""
  }
