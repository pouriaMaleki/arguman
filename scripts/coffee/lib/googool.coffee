isNumber = require './isNumber'

module.exports = class Googool

	constructor: (@parentNode, @name, @value) ->

		if localStorage.getItem(@name) isnt null

			@value = localStorage.getItem @name

		do @_init

		do @specInit

		do @setEvents

	_init: ->

		@el = document.createElement 'div'

		@el.classList.add 'googool'

		@el.title = @name

		@parentNode.appendChild @el

		return

	specInit: ->

	setEvents: ->