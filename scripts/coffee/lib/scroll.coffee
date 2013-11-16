define ['Foxie/Foxie'], (Foxie) ->

	class Scroll

		constructor: (@el, @min, @max) ->

			@_events = {}

			@_setEvents @el

			@position = 0

			@_grabbed = no
			@_grabbedAt = 0

			@foxie = new Foxie @el

		_setEvents: (el) ->

			document.addEventListener "dragstart", (e) =>

				e.preventDefault()

				return

			el.addEventListener 'mousedown', (e) =>

				e.preventDefault()

				@grab(e.pageX)

				return

			document.addEventListener 'mousemove', (e) =>

				@move(e.pageX)

				return

			document.addEventListener 'mouseup', (e) =>

				@drop(e.pageX)

				return


			return

		grab: (x) ->

			@_grabbed = yes
			@_grabbedAt = x

			@_events.start(x) if @_events.start?

			return

		move: (x) ->

			if @_grabbed

				x = x - @_grabbedAt

				if @min?

					if @position + x < @min

						x = - @position + @min


				if @max?

					if @position + x > @max

						x = - @position + @max

				@foxie
				.noTrans()
				.moveXTo(@position + x)

				@_events.scrolling(x + @position) if @_events.scrolling?

			return

		drop: (x) ->

			if @_grabbed

				@_grabbed = no

				x = x - @_grabbedAt + @position

				if @min?

					x = @min if x < @min

				if @max?

					x = @max if x > @max

				@to x

			return

		reset: ->

			@to 0

		to: (x) ->

			@foxie
			.noTrans()
			.moveXTo(x)

			@position = x

			@_events.end(x) if @_events.end?

		transTo: (x, t) ->

			@foxie
			.trans(t)
			.moveXTo(x)
			.eachFrame (time, cancel) =>

				if time > t then cancel()

				@_events.trans(@foxie._styleSetter._transformer._current[0]) if @_events.trans?

			@position = x

			@_events.end(x) if @_events.end?

		getPosition: ->

			@position

		setOptions: (@min, @max) ->

		on: (job, callback) ->

			@_events[job] = callback