class SearchsController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		elsif @model == 'book'
		  @records = Book.search_for(@content, @method)
		# else
  #     @books = Book.tagged_with(params[:tag_name])
		#   @records = @books.where('tag_name LIKE ?', '%' + @content + '%')
		end
	end

  # def search
  #   @model = params[:model]
  #   @content = params[:content]
  #   @method = params[:method]
  #   @records = search_for(@model, @content, @method)
  # end

  # private

  # def search_for(model, content, method)
  #   if model == 'user'
  #       if method == 'perfect'
  #         User.where(name: content)
  #       elsif method == 'forward'
  #         User.where('name LIKE ?', content + '%')
  #       elsif method == 'backward'
  #         User.where('name LIKE ?', '%' + content)
  #       else
  #         User.where('name LIKE ?', '%' + content + '%')
  #       end
  #   elsif model == 'book'
  #       if method == 'perfect'
  #         Book.where(title: content)
  #       elsif method == 'forward'
  #         Book.where('title LIKE ?', content + '%')
  #       elsif method == 'backward'
  #         Book.where('title LIKE ?', '%' + content)
  #       else
  #         Book.where('title LIKE ?', '%' + content + '%')
  #       end
  #   end
  # end
end
