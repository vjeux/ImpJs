
class Imp.Bool extends Imp.Value
	constructor: (@b) ->

	lt: (other) ->
		@b < other.b

	minus: (other) ->
		new Imp.Bool @b isnt other.b
