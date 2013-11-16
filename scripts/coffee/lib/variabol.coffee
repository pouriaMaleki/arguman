define [
	'./googool/simple',
	'./googool/checkbox',
	'./googool/radio',
	'./googool/slider'
	],
(Simple, CheckBox, Radio, Slider) ->

	class Variabol

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


		add: ->

			unless @objs.hasOwnProperty arguments[0]

				if typeof arguments[1] is 'boolean'

					@objs[arguments[0]] = new CheckBox @el, arguments[0], arguments[1]

				else if typeof arguments[1] is 'object'

					@objs[arguments[0]] = new Radio @el, arguments[0], arguments[2], arguments[1]

				else if typeof arguments[1] is 'number' and typeof arguments[2] is 'number' and typeof arguments[3] is 'number'

					@objs[arguments[0]] = new Slider @el, arguments[0], arguments[3], arguments[1], arguments[2], arguments[4]

				else

					@objs[arguments[0]] = new Simple @el, arguments[0], arguments[1], arguments[2]

			return @objs[arguments[0]].value



	variabol = new Variabol

	variabol.add.bind variabol