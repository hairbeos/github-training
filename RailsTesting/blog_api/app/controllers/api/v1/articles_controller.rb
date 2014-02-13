#
class Api::V1::ArticlesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # respond_to :json

  def index
    @articles = Article.all
    respond_with @articles
    # authorize! :read, @article
  end
end
