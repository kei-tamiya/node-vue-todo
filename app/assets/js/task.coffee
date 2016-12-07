tvm = new Vue
  el: "#wrapTodos",
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
    addTask: ->
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

    toggleComplete: (index) ->
      b = !this.tasks[index].completed
      t = Object.assign({}, this.tasks[index], {
        completed: b
      })
      this.$http.patch("/api/tasks/update", { body: t })
        .then ->
          this.tasks[index].completed = b
        , (response) ->
          console.log response

    updateTitle: (index) ->
      t = Object.assign({}, this.tasks[index], {
      })
      this.$http.patch("/api/tasks/update", { body: t })
        .then ->
          console.log "success"
        , (response) ->
          console.log response

    deleteTask: (index) ->
      t = Object.assign {}, this.tasks[index]
      if (confirm("「#{t.title}」　を削除してよろしいですか？"))
        this.$http.delete("/api/tasks/delete", { body: t })
          .then ->
            this.tasks.splice(index, 1)
          , (response) ->
            console.log response
  }

$ ->
  socket = io();
  $('#testForm').submit ->
    socket.emit 'chat message', $('#m').val()
    $('#m').val('')
    return false
  socket.on 'chat message', (msg) ->
    html = "<li>#{msg}</li>"
    $('#messages').append(html)

