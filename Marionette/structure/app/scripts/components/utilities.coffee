define ['app'], (App) ->
	App.module 'Entities', (Entities) ->

		App.commands.setHandler "when:fetched", (entities, callback) ->
			xhrs = _.chain([entities]).flatten().pluck("_fetch").value()
			$.when(xhrs...).done ->
				setTimeout(
					->
						callback()
					200)