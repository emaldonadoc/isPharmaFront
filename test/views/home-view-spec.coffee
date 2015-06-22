'use strict'
HomeModel = require 'models/home/home'
HomeView = require 'views/home/home-page-view'
utils = require 'lib/utils'
mediator = Chaplin.mediator

describe 'HomeViewSpec', ->

  beforeEach ->
    mediator.data.set 'services-url', "https:local"
    @model = new HomeModel()
    @view = new HomeView(model: @model)

  afterEach ->
    @model.dispose()
    @view.dispose()
    mediator.data.clear()

  it 'Home view should be renderized', ->
    expect($('#rlx-buttons-select')).to.exist
    expect($('.dispatch-btn')).to.exist

  it "When clicked dispatch button, do ajax and redirect",->
    sinon.stub(@model,'tagRequest').returns(TestUtils.promises.resolved)
    successRequest = sinon.stub(@view, 'tagRequestSuccess')
    @view.$('.dispatch-btn').click()
    expect(successRequest).to.be.calledOne

  it "When clicked dispatch button and error happend",->
    sinon.stub(@model,'tagRequest').returns(TestUtils.promises.rejected)
    errorRequest = sinon.stub(@view, 'tagRequestError')
    @view.$('.dispatch-btn').click()
    expect(errorRequest).to.be.calledOne