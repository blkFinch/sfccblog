class ArticlesController < ApplicationController
  include SessionsHelper
  protect_from_forgery with: :reset_session
  before_action :correct_user, only: [:edit, :destroy]
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

   def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:sucess] = "Article Updated!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit([
        :title, :author, :body])
    end

    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to root_url if @article.nil?
    end

   def is_admin
    unless current_user.permission >= 3
      flash[:danger] = "Not Authorized!"
      redirect_to(root_url)
    end
  end
end
