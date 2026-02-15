class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]
  def show
  end
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # edit article here
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      # return 422 so Turbo (XHR) can accept and render the form with errors
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # update the article from here
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    # destroy code here
    @article.destroy
    redirect_to article_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
