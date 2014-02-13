# Controller for Article
class Api::V1::ArticlesController < ApplicationController
  # include ActionController::MimeResponds
  include ActionController::ImplicitRender
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to action: :index
  end

  def show
    @article = Article.find params[:id]
  end

  private

    def article_params
      params.require(:article).permit(:title, :content)
    end
end
