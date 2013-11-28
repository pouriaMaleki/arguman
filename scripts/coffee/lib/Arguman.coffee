do require './setCSS'
Simple = require './googool/Simple'
Checkbox = require './googool/Checkbox'
Radio = require './googool/Radio'
Slider = require './googool/Slider'


module.exports = class Arguman

	self = @

	@_instance: null

	@get: ->

		unless self._instance?

			self._instance = new self

		self._instance

	@param: ->

		inst = self.get()

		inst.param.apply inst, arguments

	constructor: ->

		do @_init

		@objs = {}

	_init: ->

		@el = document.querySelector '.variabol'

		return if @el?

		@el = document.createElement 'div'

		@el.classList.add 'variabol'

		document.body.appendChild @el

		return

	param: ->

		unless @objs.hasOwnProperty arguments[0]

			if typeof arguments[1] is 'boolean'

				@objs[arguments[0]] = new Checkbox @el, arguments[0], arguments[1]

			else if typeof arguments[1] is 'object'

				@objs[arguments[0]] = new Radio @el, arguments[0], arguments[2], arguments[1]

			else if typeof arguments[1] is 'number' and typeof arguments[2] is 'number' and typeof arguments[3] is 'number'

				@objs[arguments[0]] = new Slider @el, arguments[0], arguments[3], arguments[1], arguments[2], arguments[4]

			else

				@objs[arguments[0]] = new Simple @el, arguments[0], arguments[1], arguments[2]

		return @objs[arguments[0]].value