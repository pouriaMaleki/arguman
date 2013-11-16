define ['variabol'], (param) ->

	window.p = param

	console.log param('Beauty', true)
	console.log param('Beast', true)
	console.log param('Busty', false)
	console.log param('StrongNumber', 200, true)
	console.log param('StrongString', 130, true)
	console.log param('Text', 10)
	console.log param('Gender', ['female', 'male', 'confused'], 'female')
	console.log param('Slider', 1, 10, 7)
	console.log param('Slidser', 1000, 2000, 457, 0) # last argument -> toFixed