# Application routes.
module.exports = (match) ->
  match '', 'home#index'
  match 'rlx-alert', 'home#alert'
  match 'rlx-driver', 'home#selectDriver'
  match 'rlx-search', 'search#index'
  match 'rlx-confirm', 'confirm-modal#index'