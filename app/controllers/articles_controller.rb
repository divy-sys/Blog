class ArticlesController < ApplicationController 

  def index 
    @articles = Article.all
  end

  def show 
    @article = Article.find(params[:id])
  end

  def create 
    @article = Article.new(params.require(:article).permit(:name, :description))
    @article.save
    redirect_to articles_path
  end

  def new 
    @article = Article.new
    if @article.save
      flash[:notice] = "Article created successfully"
      redirect_to @article 
    else
      render "new"
    end
  end

  def edit 
    @article = Article.find(params[:id])
  end

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def update 
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:name, :description))
      flash[:notice] = "Article updated successfully"
      redirect_to @article
    else 
      render "edit"
    end
  end

end