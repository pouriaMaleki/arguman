Scroll = require './Scroll'

module.exports = class SliderElement

	constructor: (@parentNode, @start, @end, @value, @fix = 2) ->

		@_events = {}

		do @_createElements

		do @_setScroller

	on: (job, callback) ->

		@_events[job] = callback

	_createElements: ->

		@el = document.createElement 'div'

		@el.classList.add 'slider'

		@handleEl = document.createElement 'div'

		@handleEl.classList.add 'slider-handle'

		@inEl = document.createElement 'div'

		@inEl.classList.add 'slider-indicator'

		@handleEl.appendChild @inEl

		@filledEl = document.createElement 'div'

		@filledEl.classList.add 'slider-filled'

		@el.appendChild @handleEl

		@el.appendChild @filledEl

		@parentNode.appendChild @el

		return

	_setScroller: ->

		@scroll = new Scroll @handleEl, 0, 160

		@distance = @end - @start

		@factor = 160 / @distance

		@scroll.to @factor * @value

		@scroll.on 'scrolling', (x) =>

			@value = x / @factor

			@inEl.innerText = (@value).toFixed(@fix)

			@_events.change(@value) if @_events.change?

			return

		@scroll.on 'end', (x) =>

			@value = x / @factor

			@inEl.innerText = (@value).toFixed(@fix)

			@_events.change(@value) if @_events.change?

			return

		@el.addEventListener 'click', (e) =>

			@transTo e.layerX

			return

		return

	transTo: (x) ->

		@scroll.transTo x, 300