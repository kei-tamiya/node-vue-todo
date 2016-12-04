mongoose = require('mongoose')
Schema = mongoose.Schema

todoSchema = new Schema({
  title: string,
  completed: boolean
})

mongoose.model('Todo', todoSchema)

# TODO 後でenvによって切り替えられるように書き換え
mongoose.connect('mondodb://localhost:8080/todo_mongo')


Todo = mongoose.model('Todo')
todo = new Todo()
todo.title = "test"
todo.completed = false
todo.save err ->
  if err then console.log err

#Todo.find({}, (err, docs) -> {
#  for key, doc of docs console.log "title: #{doc.title}"
#
#
#})