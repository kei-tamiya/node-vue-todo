express = require('express')
router = express.Router()
room_controllers = require('../app/controllers/room_controllers.coffee')
github_controllers = require('../app/webhook/github_controllers.coffee')

router.get '/', room_controllers.index
router.get '/rooms/:id', room_controllers.show

router.post '/hook/github/issue_comment', github_controllers.github_issue_comment

module.exports = router;
