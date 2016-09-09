class ArticlesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  def index
    @arts = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    #render plain: params[:article].inspect #this will display a hash representation of the passed data
    #must whitelist incoming data 
    @article = Article.new(article_params) # calls the private article_params white-listing function
    
    if @article.save #will cause error without redirect
      flash[:notice] ="Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
     @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] ="Article was updated"
      render 'edit'
    else
      render 'edit'
    end
  end
  def show
    @article = Article.find(params[:id])
  end
  
  private
    def article_params
      params.require(:article).permit(:title,:description) 
    end
end
