Googool = require '../Googool'
isNumber = require '../isNumber'
SimpleEl = require './simple/SimpleElement'

module.exports = class Simple extends Googool

	constructor: (@parentNode, @name, @value, @strict) ->

		super

	specInit: ->

		@el.classList.add 'simple'

		@input = new SimpleEl @el, @value

		return

	setEvents: ->

		@input.on 'change', (@value) =>

			@value = isNumber @input.value

			localStorage.setItem (document.URL + @name), @value

			return

		return