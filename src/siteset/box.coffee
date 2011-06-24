
class Imp.Box extends Imp.SiteSet
	constructor: (min, max) ->
		if min instanceof Array
			min = new Imp.Point min
		@min = min

		if max instanceof Array
			max = new Imp.Point max
		@max = max

	reset: (@center = null) ->
		@curr = @min.copy()
		@first = true

	next: ->
		overflow = false

		if not @first
			for i in [0 ... @min.dimensions()]
				overflow = false
				if @curr.get(i) < @max.get(i)
					@curr.set(i, @curr.get(i) + 1)
					break

				overflow = true
				@curr.set(i, @min.get(i))

			if overflow
				@curr = null

		@first = false
		if @curr? and @center?
			return @curr.plus(@center)
		@curr

	contains: (point) ->
		for d, i in point.coordinates
			unless @min.get(i) <= d <= @max.get(i)
				return false
		true
