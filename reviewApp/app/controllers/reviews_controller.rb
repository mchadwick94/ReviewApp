class ReviewsController < ApplicationController
  before_action :login_required


  def index
    @reviews = Review.all
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
      if @review.save
        redirect_to @review
      else
        render 'new'
      end
    end
  

  def update
      if @review.update(review_params)
       
      else
        
      end
    end
  

 
  def destroy
          @review = Review.find(params[:id])
          @review.destroy
          redirect_to reviews_path
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:author, :rating, :reviewText, :reviewDate, :user_id)
    end
end
