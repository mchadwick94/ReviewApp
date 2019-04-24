class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def show
		@product = Product.find(params[:id])
		@reviews = Review.where(product_id: @product.id).order("Created_at DESC")
		@avg_review = @reviews.average(:rating)
		
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

	def search
	@products = if params[:term]
		Product.where('pName LIKE ?', "%#{params[:term]}%")
	else
		Product.all
		end
		end


	private 
	def product_params 
		params.require(:product).permit(:pName, :brand, :averageCost, :category, :releaseDate, :description, :image)
	end
end
