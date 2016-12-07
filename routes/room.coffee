express = require('express')
router = express.Router()
task_controllers = require('../app/controllers/task_controllers.coffee')
room_controllers = require('../app/controllers/room_controllers.coffee')

router.get '/', room_controllers.index
router.get '/rooms/:id', room_controllers.show

module.exports = router;
