
class Imp.Raw extends Imp.Image
	constructor: (@dimensions) ->
		@data = new Array dimensions.reduce (a, b) -> a * b

		@strides = []
		acc = 1
		for d in dimensions
			@strides.push acc
			if acc
				acc *= d

		@domain = new Imp.Box (dimensions.map (d) -> 0), (dimensions.map (d) -> d - 1)

	copy: ->
		new Imp.Raw @dimensions

	contains: (point) ->
		@domain.contains point

	index: (point) ->
		index = 0
		i = 0
		for c in point.coordinates
			index += @strides[i++] * c
		index

	set: (point, val) ->
		@data[@index point] = val

	get: (point) ->
		@data[@index point]

	draw: (canvas) ->
		context = canvas.getContext '2d'
		imageData = context.getImageData 0, 0, canvas.width, canvas.height
		i = 0
		@each (s) =>
			rgba = @get(s)
			imageData.data[i * 4 + 0] = rgba.r
			imageData.data[i * 4 + 1] = rgba.g
			imageData.data[i * 4 + 2] = rgba.b
			imageData.data[i * 4 + 3] = rgba.a
			++i
		context.putImageData imageData, 0, 0

Imp.Image.fromCanvas = (canvas) ->
	context = canvas.getContext '2d'
	imageData = context.getImageData 0, 0, canvas.width, canvas.height

	image = new Imp.Raw [canvas.width, canvas.height]
	for i in [0 ... imageData.data.length / 4]
		image.data[i] = new Imp.RGBA imageData.data[i * 4 + 0],
									 imageData.data[i * 4 + 1],
									 imageData.data[i * 4 + 2],
									 imageData.data[i * 4 + 3]
	image

Imp.Image.fromUrl = (url, callback) ->
	image = new Image
	image.onload = ->
		canvas = document.createElement 'canvas'
		canvas.width = image.width
		canvas.height = image.height
		context = canvas.getContext '2d'
		context.drawImage image, 0, 0, image.width, image.height
		callback Imp.Image.fromCanvas canvas
	image.src = url
