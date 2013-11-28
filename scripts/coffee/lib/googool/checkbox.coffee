Googool = require '../Googool'

module.exports = class Checkbox extends Googool

	constructor: (@parentNode, @name, @value) ->

		super

	specInit: ->

		@el.classList.add 'check'

		console.log @value

		if @value is 'true' or @value is true

			@el.classList.add 'checked'

		@span = document.createElement 'span'

		@span.innerHTML = @name

		@el.appendChild @span

		return

	setEvents: ->

		@el.addEventListener 'click', (e) =>

			@value = !@value

			console.log (document.URL + @name), @value

			localStorage.setItem (document.URL + @name), @value

			if @value

				@el.classList.add 'checked'

			else

				@el.classList.remove 'checked'

			return