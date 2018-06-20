class CategoriesController < ApplicationController
	http_basic_authenticate_with name: 'user', password: '123', except: [:index, :show]

	def index
		@categories = Category.all
	end

	def show
		@categories = Category.all
		@category = Category.find(params[:id])
	end

	def new
		@categories = Category.all
		@category = Category.new
	end

	def edit
		@categories = Category.all
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			redirect_to @category
		else
			redirect_to categories_path
		end
	end

	def update
		@category = Category.find(params[:id])

		if @category.update(category_params)
			redirect_to @category
		else
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy

		redirect_to categories_path
	end

	private
	def category_params
		params.require(:category).permit(:name, :description)
	end
end
