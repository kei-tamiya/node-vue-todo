#Task = require('../../models/task.js')

vm = new Vue
  el: "#wrapTodosTest",
  mounted: ->
    this.$http.get('/api/tasks/get')
      .then (response) ->
        this.tasks = response.body.data
      ,(response) ->
        console.log response
  data: {
    newTask: "",
    tasks: []
  },
  methods: {
    add: ->
      nt = this.newTask.trim()
      if (!nt) then return
      t = {
        title: nt,
        completed: false
      }
      this.$http.post('/api/tasks/post', t)
        .then (response) ->
          this.tasks.push(response.body)
        ,(response) ->
          console.log response
      this.newTask = ""
  }
