#Todo = require('../../models/task.js')

vm = new Vue
  el: "#wrapTodosTest",
  data: {
    todos: [
      {title: "titletitletitle", completed: false},
      {title: "fkasdofkoas", completed: false},
      {title: "tokyo is dead", completed: false}
    ]
  }
