class TodosController < ApplicationController
	respond_to :html, :json

	def index
		respond_with Todo.all	
	end
end