class ArticlesController < ApplicationController
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  
  before_action :set_article, only: [:edit,:update,:show,:destroy] 
  # will call set article function before executing other actions(do not specify only if execute before all actions)
  
  
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
  end

  def update
    if @article.update(article_params)
      flash[:notice] ="Article was updated"
      render 'edit'
    else
      render 'edit'
    end
  end
  def show
    set_article
  end
  def destroy
    @article.destroy
    flash[:notice] ="Article titled \"#{@article.title}\" went bye-bye"
    redirect_to articles_path
  end
  private
    def article_params
      params.require(:article).permit(:title,:description) 
    end
    def set_article
      @article = Article.find(params[:id])
    end
end
