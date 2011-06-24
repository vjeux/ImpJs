
class Imp.Value
	min: (other) ->
		if other is null or @lt other
			@
		else
			other

	max: (other) ->
		if other is null or not @lt other
			@
		else
			other
