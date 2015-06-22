# Application routes.
module.exports = (match) ->
  match '', 'home#index'
  match 'isp-services', 'services#index'