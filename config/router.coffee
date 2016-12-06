express = require('express')
router = express.Router()
task_controllers = require('../app/controllers/task_controllers.coffee')
api_task = require('../app/api/tasks/task.coffee')

router.get '/', task_controllers.index

router.get '/api/tasks/get', api_task.get
router.post '/api/tasks/post', api_task.post
router.patch '/api/tasks/update', api_task.update
router.delete '/api/tasks/delete', api_task.delete

module.exports = router;
