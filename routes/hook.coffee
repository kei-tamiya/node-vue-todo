express = require('express')
router = express.Router()
github_controllers = require('../app/webhook/github_controllers.coffee')

router.get '/github/issue', github_controllers.githubIssueGet
router.get '/github/issue_comment', github_controllers.githubIssueCommentGet

router.post '/github/issue', github_controllers.githubIssuePost
router.post '/github/issue_comment', github_controllers.githubIssueCommentPost

module.exports = router;
