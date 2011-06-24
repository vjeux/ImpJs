
class Imp.SiteSet
	each: (param..., callback) ->
		@reset param...
		while (s = @next()) isnt null
			if (callback s) is false
				break
