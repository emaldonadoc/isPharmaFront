# Application routes.
module.exports = (match) ->
  match '', 'home#index'
  match 'isp-cursos', 'courses#index'
  match 'isp-quienesSomos', 'who#index'
  match 'isp-contacto', 'contact#index'