Googool = require '../Googool'

module.exports = class Radio extends Googool

	constructor: (@parentNode, @name, @value, @values) ->

		super

	specInit: ->

		@bilbools = []

		@selected = null

		@el.classList.add 'radio'

		for value, id in @values

			@bilbools[id] = document.createElement 'div'

			@bilbools[id].classList.add 'check'

			if @value is value

				@bilbools[id].classList.add 'checked'

				@selected = id

			span = document.createElement 'span'

			span.innerHTML = value

			@bilbools[id].appendChild span

			@el.appendChild @bilbools[id]

		return

	setEvents: ->

		for i, id in @bilbools

			do (i, id) =>

				i.addEventListener 'click', (e) =>

					if @selected?

						@bilbools[@selected].classList.remove 'checked'

					@selected = id

					@bilbools[@selected].classList.add 'checked'

					@value = @values[@selected]

					localStorage.setItem @name, @value

		return