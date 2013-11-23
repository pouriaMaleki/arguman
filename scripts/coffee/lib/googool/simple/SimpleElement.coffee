Mover = require './Mover'
isNumber = require '../../isNumber'

module.exports = class SimpleElement

	constructor: (@parentNode, @value) ->

		@_events = {}

		do @_createElements

		do @_setMover

	on: (job, callback) ->

		@_events[job] = callback

	_createElements: ->

		@el = document.createElement 'input'

		@el.type = 'text'

		num = isNumber @el.value

		if num

			@value = num

		@el.value = @value

		@el.addEventListener 'keyup', (e) =>

			num = isNumber @el.value

			if num

				@value = num

			@el.value = @value

			@_events.change(0) if @_events.change?

		@parentNode.appendChild @el

		return

	_setMover: ->

		@mover = new Mover @el

		@mover.on 'move', (x) =>

			@value = isNumber @value

			@value += x

			@el.value = @value

			@_events.change(0) if @_events.change?

			return

		return