
class Imp.Node extends Imp.Site
	constructor: (@value) ->
		@mark = false
		@edges = []

	push: (nodes...) ->
		for node in nodes
			if node instanceof Array
				@edges.push {node: node[0], weight: node[1]}
			else
				@edges.push {node: node}

