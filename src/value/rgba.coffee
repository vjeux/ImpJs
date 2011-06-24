
class Imp.RGBA extends Imp.Value
	constructor: (@r, @g, @b, @a) ->

	minus: (other) ->
		new Imp.RGBA (@r - other.r),
					 (@g - other.g),
					 (@b - other.b),
					 (Math.max @a, other.a)

	min: (other) ->
		if other is null
			return @
		new Imp.RGBA (Math.min @r, other.r),
					 (Math.min @g, other.g),
					 (Math.min @b, other.b),
					 (Math.min @a, other.a)

	max: (other) ->
		if other is null
			return @
		new Imp.RGBA (Math.max @r, other.r),
					 (Math.max @g, other.g),
					 (Math.max @b, other.b),
					 (Math.max @a, other.a)
