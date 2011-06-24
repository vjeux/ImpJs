
class Imp.Queue extends Imp.SiteSet
	constructor: ->
		@array = []

	push: (val) ->
		@array.push(val)

	next: ->
		if @array.length
			@array.shift()
		else
			null
