Github = require('./github_model.coffee')
GithubIssue = Github.GithubIssue
GithubIssueComment = Github.GithubIssueComment

exports.githubIssuePost = (req, res) ->
  json = req.body
  i = new GithubIssue {
    room_id: json.room_id,
    number: json.number,
    title: json.title,
    html_url: json.html_url,
    state: json.state,
    user: {
      login: json.user.login,
      avatar_url: json.user.avatar_url
    },
    created_at: json.created_at
  }
  i.save (err, resource) ->
    res.status(500).send { error: err } if err?
    res.status(200).send resource

exports.githubIssueCommentPost = (req, res) ->
  json = req.body
  c = new GithubIssueComment {
    room_id: json.room_id,
    user: {
      login: json.user.login,
      avatar_url: json.user.avatar_url
    },
    body: json.body,
    created_at: json.created_at
  }
  c.save (err, resource) ->
    res.status(500).send { error: err } if err?
    res.status(200).send resource
