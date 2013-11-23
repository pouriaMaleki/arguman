module.exports = class Mover

	constructor: (@el, @min, @max) ->

		@_events = {}

		do @_setEvents

		@position = 0

		@_grabbed = no
		@_last = 0

		@scale = 1

	_setEvents: ->

		document.addEventListener "dragstart", (e) =>

			e.preventDefault()

			return

		@el.addEventListener 'mousemove', (e) =>

			if e.layerY < 10

				@el.style.cursor = 'ew-resize'

			else

				@el.style.cursor = 'text'

		@el.addEventListener 'mousedown', (e) =>

			e.preventDefault()

			@grab(e.pageX)

			return

		document.addEventListener 'mousemove', (e) =>

			@move(e.pageX, e.altKey, e.shiftKey)

			return

		document.addEventListener 'mouseup', (e) =>

			@drop(e.pageX)

			return


		return

	grab: (x) ->

		@_grabbed = yes
		@_last = x

		@_events.start(x) if @_events.start?

		return

	move: (x, alt, shift) ->

		if @_grabbed

			@scale = 1

			if alt

				@scale = .5

			if shift

				@scale = 2

			@el.style.cursor = 'ew-resize'

			z = x - @_last

			@_last = x

			@_events.move(z * @scale) if @_events.move?

		return

	drop: (x) ->

		if @_grabbed

			@el.focus()

			@_grabbed = no

		return

	on: (job, callback) ->

		@_events[job] = callback