class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params['id'].to_i)
  end

  def new
    @article = Article.new
    # to display the form
  end

  def create
    @article = Article.new(article_params)
    @article.save
    # to save the instance of a new Article
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require('article').permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
