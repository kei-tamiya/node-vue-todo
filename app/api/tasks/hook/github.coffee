GithubIssue = require('../../../webhook/github_issue/github_model.coffee')
GithubIssueComment = require('../../../webhook/github_issue/github_model.coffee')

exports.GithubIssueGet = (req, res) ->
  GithubIssue.find { room_id: req.params.room_id }, (err, issues) ->
    res.status(500).send { error: err } if err?
    res.status(200).send { data: issues }

exports.GithubIssueCommentGet = (req, res) ->
  GithubIssueComment.find { room_id: req.params.room_id }, (err, comments) ->
    res.status(500).send { error: err } if err?
    res.status(200).send { data: comments }