class ArticlesController < ApplicationController
	include ArticlesHelper
	before_filter :require_login, except: [:index, :show]

	def index
		@articles = Article.all
	end
	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		@article.author = current_user
		@article.save

		flash.notice = "The Article '#{@article.title}' was created!"

		redirect_to article_path(@article)
	end
	def edit
		@article = Article.find(params[:id])
		check_user(@article)
	end
	def update
		@article = Article.find(params[:id])
		check_user(@article) do
			
			@article.update(article_params)

			flash.notice = "The Article '#{@article.title}' was updated!"

			redirect_to article_path(@article)
		end
	end
	def destroy
		@article = Article.find(params[:id])
		check_user(@article) do
			

			flash.notice = "The Article '#{@article.title}' was deleted!"
			@article.destroy
			redirect_to articles_path
		end
	end
end
