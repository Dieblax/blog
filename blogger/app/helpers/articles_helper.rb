module ArticlesHelper
	def article_params
		params.require(:article).permit(:title, :body, :tag_list, :image)
	end
	def check_user(article)
		unless current_user == article.author
			redirect_to article_path(article)
			return false
		else 
			yield
		end
	end
end
