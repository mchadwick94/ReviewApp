class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def show
		@product = Product.find(params[:id])
	end

	def index
		@products = Product.all
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to @product
		else
			render 'new'
		end
	end

	def update
	end

	def edit
	end

	def destroy
	end

	private 
	def product_params 
		params.require(:product).permit(:pName, :brand, :averageCost, :category, :releaseDate, :description, :productImage)
	end
end
