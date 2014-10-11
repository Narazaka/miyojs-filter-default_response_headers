chai = require 'chai'
chai.should()
expect = chai.expect
sinon = require 'sinon'
MiyoFilters = require '../default_response_headers.js'

describe 'default_response_headers', ->
	it 'should set default_response_headers', ->
		ms = sinon.stub()
		ms.default_response_headers = {}
		argument =
			default_response_headers:
				Charset: 'UTF-8'
				Sender: 'test_ghost'
			other:
				'other'
		request = sinon.stub()
		id = 'OnTest'
		stash = null
		return_argument = MiyoFilters.default_response_headers.call ms, argument, request, id, stash
		return_argument.should.be.deep.equal argument
		ms.default_response_headers.should.be.deep.equal argument.default_response_headers
