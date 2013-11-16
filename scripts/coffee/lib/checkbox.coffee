define ['../googool'], (Googool) ->

	class Checkbox extends Googool

		constructor: (@parentNode, @name, @value) ->

			super

		specInit: ->

			@input = document.createElement 'input'

			@input.type = 'checkbox'

			@input.checked = @value

			@el.appendChild @input

			return

		setEvents: ->

			@input.addEventListener 'change', (e) =>

				@value = @input.checked

			return