class ReviewsController < ApplicationController
  before_action :login_required
  before_action :set_product, only: [:index, :create]
  before_action :set_profile


  def index
    @reviews = Review.where(:product_id => @product)
  end

  def show
        @review = Review.find(params[:id])

  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id
    @review.author = @profile.fullName
    @review.image_file_name = @profile.image
      if @review.save
        redirect_to @product
      else
        render 'new'
      end
    end
  

  def update
      if @review.update(review_params)
       
      else
        
      end
    end
  
def set_product
  @product = Product.find(params[:product_id])
end

def set_profile
    @profile = Profile.where(:user_id => current_user.id).first
end
 
  def destroy
          @review = Review.find(params[:id])
          @review.destroy
          redirect_to product_reviews_path
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:author, :rating, :reviewText, :reviewDate, :user_id, :image_file_name)
    end
end
