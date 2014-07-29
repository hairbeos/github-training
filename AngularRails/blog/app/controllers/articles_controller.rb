class ArticlesController < ApplicationController
  respond_to :json, :html

  def index
    @articles = Article.all

    respond_with @articles
  end

  def show
    @article = Article.find(params[:id])

    respond_with @article
  end

  def new
    @article = Article.new
    respond_with @article
  end

  def create
    @article = Article.new safe_params
    if @article.save!
      respond_with @article
    end
    # error here
  end

  private
    def safe_params
      params.require(:article).permit(:title, :content)
    end
end
