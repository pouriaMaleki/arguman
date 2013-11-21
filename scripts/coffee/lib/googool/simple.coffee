Googool = require '../Googool'
isNumber = require '../isNumber'

module.exports = class Simple extends Googool

	constructor: (@parentNode, @name, @value, @strict) ->

		super

	specInit: ->

		@el.classList.add 'simple'

		@input = document.createElement 'input'

		@input.type = 'text'

		@input.value = @value

		@el.appendChild @input

		return

	setEvents: ->

		if @strict

			if isNumber @input.value

				@strictType = 'number'

			else

				@strictType = 'string'

		@input.addEventListener 'keyup', (e) =>

			if @strict

				if @strictType is 'number'

					if num = isNumber @input.value

						@value = num

					else

						@input.value = @value

				else if @strictType is 'string'

					@value = @input.value

				return

			@value = isNumber @input.value

			@value = @input.value if @value is false

			localStorage.setItem @name, @value

			return

		return