express = require('express')
router = express.Router()
api_task = require('../app/api/tasks/task.coffee')
api_room = require('../app/api/tasks/room.coffee')

router.get '/tasks/get', api_task.get
router.post '/tasks/post', api_task.post
router.patch '/tasks/update', api_task.update
router.delete '/tasks/delete', api_task.delete

router.get '/rooms/get', api_room.get
router.post '/rooms/post', api_room.post
router.delete '/rooms/delete', api_room.delete

module.exports = router;
