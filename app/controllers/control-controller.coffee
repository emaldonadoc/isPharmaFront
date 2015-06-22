Controller = require 'controllers/base/controller'
utilsChaplin = Chaplin.utils

module.exports = class ControlController extends Controller

  index:->
    utilsChaplin.redirectTo(controller: 'home', action:'index')