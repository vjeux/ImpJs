
class Imp.Graph extends Imp.SiteSet
	constructor: ->
		@nodes = []

	push: (val...) ->
		@nodes.push val...

	reset: (@traversal) ->
		@curr = 0
		if @traversal?
			if @traversal is 'bfs'
				@structure = new Imp.Queue
			else # 'dfs'
				@structure = new Imp.Stack

			@nodes.forEach (node) -> node.mark = false
			@nodes[0].mark = true
			@structure.push @nodes[0]

	next: ->
		if @traversal?
			ret = @structure.next()
			if ret isnt null
				for edge in ret.edges
					if not edge.node.mark
						edge.node.mark = true
						@structure.push edge.node
			ret
		else
			if @curr is @nodes.length
				null
			else
				@nodes[@curr++]
