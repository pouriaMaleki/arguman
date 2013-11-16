define ['../googool', '../is-number', '../slider-element'], (Googool, isNumber, SliderEl) ->

	class Slider extends Googool

		constructor: (@parentNode, @name, @value, @start, @end, @fix) ->

			super

		specInit: ->

			@el.classList.add 'slide'

			@parentNode.appendChild @el

			@sliderEl = new SliderEl @el, @start, @end, @value, @fix

			return

		setEvents: ->

			@sliderEl.on 'change', (@value) =>

				return

			return