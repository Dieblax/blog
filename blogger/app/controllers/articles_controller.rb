class ArticlesController < ApplicationController
	include ArticlesHelper
	def index
		@articles = Article.all
	end
	def show
		@article = Article.find(params[:id])
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "The Article '#{@article.title}' was created!"

		redirect_to article_path(@article)
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "The Article '#{@article.title}' was updated!"

		redirect_to article_path(@article)
	end
	def destroy
		@article = Article.find(params[:id])

		flash.notice = "The Article '#{@article.title}' was deleted!"
		@article.destroy
		redirect_to articles_path
	end
end
