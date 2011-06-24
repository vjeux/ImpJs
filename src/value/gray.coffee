
class Imp.Gray extends Imp.Value
	constructor: (@i) ->

	lt: (other) ->
		@i < other.i

	minus: (other) ->
		new Imp.Gray @i - other.i
