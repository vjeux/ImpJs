
Imp.Image::erosion = (window) ->
	ret = @copy()

	@each (site) =>
		min = null
		window.each site, (neighb) =>
			if @contains neighb
				min = @get(neighb).min min
		ret.set(site, min)

	ret

Imp.Image::dilation = (window) ->
	ret = @copy()

	@each (site) =>
		max = null
		window.each site, (neighb) =>
			if @contains neighb
				max = @get(neighb).max max
		ret.set(site, max)

	ret

Imp.Image::opening = (window) ->
	(@dilation window).erosion window

Imp.Image::closing = (window) ->
	(@erosion window).dilation window

Imp.Image::gradient = (window) ->
	(@dilation window).minus @erosion window