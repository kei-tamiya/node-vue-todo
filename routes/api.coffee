express = require('express')
router = express.Router()
api_task = require('../app/api/tasks/task.coffee')
api_room = require('../app/api/tasks/room.coffee')
api_hook_github_issue = require('../app/api/tasks/hook/github.coffee')

router.get '/rooms/get', api_room.get
router.post '/rooms/post', api_room.post
router.delete '/rooms/delete', api_room.delete

router.get '/rooms/:room_id/tasks/get', api_task.get
router.post '/rooms/:room_id/tasks/post', api_task.post
router.patch '/rooms/:room_id/tasks/update', api_task.update
router.delete '/rooms/:room_id/tasks/delete', api_task.delete

router.get '/rooms/:room_id/hook/github/issue/get', api_hook_github_issue.GithubIssueGet
router.get '/rooms/:room_id/hook/github/issue_comment/get', api_hook_github_issue.GithubIssueCommentGet

module.exports = router;
