
Imp.Image::morph = (raw_getter, raw_setter) ->
	getter = raw_getter
	if raw_getter.length is 1
		getter = (site) => raw_getter @get(site)

	setter = raw_setter
	if raw_setter.length is 1
		setter = (site, val) => @set(site, raw_setter val)

	{
		__proto__: @

		get: (site) ->
			getter site

		set: (site, val) ->
			setter site, val
	}


Imp.Image::rgba2gray = ->
	@morph  ((rgba) -> new Imp.Gray 0.2125 * rgba.r + 0.7154 * rgba.b + 0.0721 * rgba.b),
			((gray) -> new Imp.RGBA gray.i, gray.i, gray.i, 255)

Imp.Image::gray2rgba = ->
	@morph  ((gray) -> new Imp.RGBA gray.i, gray.i, gray.i, 255),
			((rgba) -> new Imp.Gray 0.2125 * rgba.r + 0.7154 * rgba.b + 0.0721 * rgba.b)

Imp.Image::gray2bool = (threeshold = 128) ->
	@morph  ((gray) -> new Imp.Bool gray.i > threeshold),
			((bool) -> new Imp.Gray if bool.b then 255 else 0)

Imp.Image::bool2gray = ->
	@morph  ((bool) -> new Imp.Gray if bool.b then 255 else 0),
			((gray) -> new Imp.Bool gray.i > 0)

