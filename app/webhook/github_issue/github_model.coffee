mongoose = require('mongoose')
Schema = mongoose.Schema

GithubIssue = new Schema({
  room_id: String,
  number: Number,
  title: String,
  html_url: String,
  state: String,
  user: {
    login: String,
    avatar_url: String,
  },
  created_at: String
})

GithubIssueComment = new Schema({
  room_id: String,
  user: {
    login: String,
    avatar_url: String,
  },
  body: String,
  created_at: String
})

Github = {
  GithubIssue,
  GithubIssueComment
}

module.exports = mongoose.model('Github', Github)