define ['marionette'], (Marionette) ->
	do (Marionette) ->
		class Marionette.Region.Modal extends Marionette.Region
			
			onShow: (view) ->
				view.$el.modal 'show'
				view.$el.on 'hide.bs.modal', => @closeModal()

			closeModal: ->
				@close()