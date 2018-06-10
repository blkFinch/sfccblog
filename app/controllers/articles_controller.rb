class ArticlesController < ApplicationController
  include SessionsHelper

  def new
    @user = current_user
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.by_time.reverse_order
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Post Created! Congrats!"
      redirect_to root_path
    else
      flash_error(@article)
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit([
        :title, :author, :body])
    end
end
