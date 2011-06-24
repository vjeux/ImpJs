
class Imp.Stack extends Imp.SiteSet
	constructor: ->
		@array = []

	push: (val) ->
		@array.push(val)

	next: ->
		if @array.length
			@array.pop()
		else
			null
