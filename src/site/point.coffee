
class Imp.Point extends Imp.Site
	constructor: (@coordinates) ->

	copy: ->
		new Imp.Point @coordinates.concat()

	dimensions: ->
		@coordinates.length

	get: (i) ->
		@coordinates[i]

	set: (i, val) ->
		@coordinates[i] = val

	plus: (other) ->
		ret = @copy()
		for d, i in other.coordinates
			ret.set(i, ret.get(i) + d)
		ret
