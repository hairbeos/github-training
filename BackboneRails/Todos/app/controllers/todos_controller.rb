class TodosController < ApplicationController
	respond_to :json, :html

	def index
		respond_with(@todos = Todo.all)
	end
end