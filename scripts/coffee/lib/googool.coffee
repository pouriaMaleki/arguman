define ['is-number'], (isNumber) ->

	class Googool

		constructor: (@parentNode, @name, @value) ->

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