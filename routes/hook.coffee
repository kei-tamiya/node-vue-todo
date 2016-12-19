express = require('express')
router = express.Router()
github_controllers = require('../app/webhook/github_issue/github_controllers.coffee')

router.post '/github/issue', github_controllers.githubIssuePost
router.post '/github/issue_comment', github_controllers.githubIssueCommentPost

module.exports = router;
