vm = new Vue
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

    toggleComplete: (index) ->
      b = !this.tasks[index].completed
      t = Object.assign({}, this.tasks[index], {
        completed: b
      })
      this.$http.patch('/api/tasks/update', t)
        .then ->
          this.tasks[index].completed = b
        , (response) ->
          console.log response

    deleteTask: (index) ->
      t = Object.assign {}, this.tasks[index]
      if (confirm("「#{t.title}」　を削除してよろしいですか？"))
        this.$http.delete('/api/tasks/delete', t)
          .then ->
            this.tasks.splice(index, 1)
          , (response) ->
            console.log response
  }

