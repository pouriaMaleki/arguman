module.exports = (n) ->

	num = parseFloat(n)

	if not isNaN(num) and isFinite(n)

		return num

	return false