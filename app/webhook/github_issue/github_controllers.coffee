GithubIssue = require('./github_model.coffee')
GithubIssueComment = require('./github_model.coffee')

Room = require('../../models/room.coffee')

_ = require('lodash')

exports.githubIssuePost = (req, res) ->
  json = req.body
  action = json.action

  if action == "opened"
    console.log "opened!!"

#  i = new GithubIssue {
#    room_id: json.room_id,
#    number: json.number,
#    title: json.title,
#    html_url: json.html_url,
#    state: json.state,
#    body: body,
#    user: {
#      login: json.user.login,
#      avatar_url: json.user.avatar_url
#    },
#    created_at: json.created_at
#  }
#  i.save (err, resource) ->
#    res.status(500).send { error: err } if err?
#    res.status(200).send resource

exports.githubIssueCommentPost = (req, res) ->
  json = req.body.issue
  body = json.body
  console.log "json : #{JSON.stringify json}"
  console.log "body : #{body}"
  # TODO /rooms/の文字列を見つかるように正規表現を修正
  if !body.match "/rooms/"
    console.log "Not Found..."
    missingErr = new Error("missing room_id")
    res.status(500).send { error: missingErr }
    return

  roomIdx = body.indexOf "/rooms/"


  roomId = body.substr(roomIdx+7)
  console.log "roomId : #{roomId}"
  Room.find { _id: roomId }, (err, room) ->
    res.status(500).send { error: err } if err?

    console.log "room : #{room}"
    if room
      c = new GithubIssueComment {
        room_id: roomId,
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
    return



