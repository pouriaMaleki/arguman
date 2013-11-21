Googool = require '../Googool'
isNumber = require '../isNumber'
SliderEl = require './slider/SliderElement'

module.exports = class Slider extends Googool

	constructor: (@parentNode, @name, @value, @start, @end, @fix) ->

		super

	specInit: ->

		@el.classList.add 'slide'

		@parentNode.appendChild @el

		@sliderEl = new SliderEl @el, @start, @end, @value, @fix

		return

	setEvents: ->

		@sliderEl.on 'change', (@value) =>

			localStorage.setItem @name, @value

			return

		return