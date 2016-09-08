class ArticlesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  def new
    @article = Article.new
  end
  def create
    render plain: params[:article].inspect #this will display a hash representation of the passed data
    #must whitelist incoming data 
    #@article = Article.new(article_params) # calls the private article_params white-listing function
  end
  private
    def article_params
      params.require(:article).permit(:title,:description)
    end
end
