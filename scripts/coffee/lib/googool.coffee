isNumber = require './isNumber'

module.exports = class Googool

	constructor: (@parentNode, @name, @value) ->

		#development:
		# localStorage.removeItem document.URL + @name

		if localStorage.getItem(document.URL + @name) isnt null

			@value = localStorage.getItem (document.URL + @name)

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