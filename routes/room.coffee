express = require('express')
router = express.Router()
room_controllers = require('../app/controllers/room_controllers.coffee')

router.get '/', room_controllers.index
router.get '/rooms/:id', room_controllers.show

module.exports = router;
