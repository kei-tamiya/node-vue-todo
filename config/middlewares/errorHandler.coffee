exports.logErrors = (err, req, res, next) ->
  console.log err.stack
  next(err)

exports.clientErrorhandler = (err, req, res, next) ->
  res.status(500).json {
    message: err.message,
    error: err
  }

exports.errorHandler = (err, req, res, next) ->
  res.status err.status || 500
  res.render 'error', {
    message: err.message,
    error: err
  }

exports.notFoundErrorHandler = (req, res, next) ->
  res.status(404).render "404"
