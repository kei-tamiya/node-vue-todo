socket = io();

Vue.component('task-item', {
  template: '\
    <div>\
      <h2 v-bind:class="{completed: task.completed}">\
        <span>\
            <input type="checkbox" v-on:click="$emit(\'toggle-complete\')" v-model="task.completed" />\
            {{ task.title }}\
        </span>\
        <span>\
            <input class="btn" type="button" v-on:click="$emit(\'delete-task\')" value="x" />\
        </span>\
    </div>\
  ',
  props: ['task']
})

tvm = new Vue
  el: "#wrapTodos",
  mounted: ->
    this.$http.get("/api/rooms/#{$('#roomId').text()}/tasks/get")
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
        room_id: $('#roomId').text(),
        title: nt,
        completed: false
      }
      this.$http.post("/api/rooms/#{$('#roomId').text()}/tasks/post", t)
        .then (response) ->
          socket.emit 'addTask', response.body
        ,(response) ->
          console.log response
      this.newTask = ""

    toggleComplete: (index) ->
      b = !this.tasks[index].completed
      t = Object.assign({}, this.tasks[index], {
        completed: b
      })
      this.$http.patch("/api/rooms/#{$('#roomId').text()}/tasks/update", { body: t })
        .then ->
          socket.emit 'toggleComplete', { index: index, completed: b }
        , (response) ->
          console.log response

    updateTitle: (index) ->
      t = Object.assign({}, this.tasks[index], {
      })
      this.$http.patch("/api/rooms/#{$('#roomId').text()}/tasks/update", { body: t })
        .then ->
          socket.emit 'updateTitle', { index: index, title: t.title }
        , (response) ->
          console.log response

    deleteTask: (index) ->
      t = Object.assign {}, this.tasks[index]
      if (confirm("「#{t.title}」　を削除してよろしいですか？"))
        this.$http.delete("/api/rooms/#{$('#roomId').text()}/tasks/delete", { body: t })
          .then ->
            socket.emit 'deleteTask', index
          , (response) ->
            console.log response
  }

socket.on 'addTask', (task) ->
  tvm.tasks.push(task)

socket.on 'toggleComplete', (data) ->
  tvm.tasks[data.index].completed = data.completed

socket.on 'updateTitle', (data) ->
  tvm.tasks[data.index].title = data.title

socket.on 'deleteTask', (index) ->
  tvm.tasks.splice(index, 1)
