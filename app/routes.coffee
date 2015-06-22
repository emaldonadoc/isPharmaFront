# Application routes.
module.exports = (match) ->
  match '', 'home#index'
  match 'isp-courses', 'courses#index'