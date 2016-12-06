module.exports = {
  entry: {
    'public/js/bundle': './app/assets/js/*.js'
  },
  output: {
    path: './',
    filename: '[name].js'
  }
};