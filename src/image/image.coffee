
class Imp.Image
	each: (param...) ->
		@domain.each param...
		@

Imp.Image::fill = (content) ->
	if content instanceof Function
		@each (s) =>
			@set(s, content s)
	else if content instanceof Array
		i = 0
		@each (s) =>
			@set(s, content[i++])
	else
		@each (s) =>
			@set(s, content)
	@

Imp.Image::flatten = ->
	@each (s) ->
		@set(s, @get(s))

Imp.Image::minus = (other) ->
	ret = @copy()
	ret.fill (s) =>
		@get(s).minus other.get s
