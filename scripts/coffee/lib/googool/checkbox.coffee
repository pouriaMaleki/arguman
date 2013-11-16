define ['googool'], (Googool) ->

	class Checkbox extends Googool

		constructor: (@parentNode, @name, @value) ->

			super

		specInit: ->

			@el.classList.add 'check'

			if @value

				@el.classList.add 'checked'

			@span = document.createElement 'span'

			@span.innerHTML = @name

			@el.appendChild @span

			return

		setEvents: ->

			@el.addEventListener 'click', (e) =>

				@value = !@value

				if @value

					@el.classList.add 'checked'

				else

					@el.classList.remove 'checked'

				return