express = require('express')
router = express.Router()
task_controllers = require('../app/controllers/task_controllers.coffee')
room_controllers = require('../app/controllers/room_controllers.coffee')
api_task = require('../app/api/tasks/task.coffee')
api_room = require('../app/api/tasks/room.coffee')

router.get '/tasks', task_controllers.index
router.get '/', room_controllers.index
router.get '/rooms/:id', room_controllers.show

router.get '/api/tasks/get', api_task.get
router.post '/api/tasks/post', api_task.post
router.patch '/api/tasks/update', api_task.update
router.delete '/api/tasks/delete', api_task.delete

router.get '/api/rooms/get', api_room.get
router.post '/api/rooms/post', api_room.post
router.delete '/api/rooms/delete/:id', api_room.delete

module.exports = router;
