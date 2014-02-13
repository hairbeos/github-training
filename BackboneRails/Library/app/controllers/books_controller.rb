class BooksController < ApplicationController
	respond_to :json, :html

	def index
		respond_with(@books = Book.all)
	end

	def new
		@book = Book.new
		respond_with(@book)
	end

	def create
		book = Book.new(get_params)

		if book.save
			respond_with(book)
		end
	end

	private
	def get_params
		params.require(:book).permit(:title, :author)
	end
end