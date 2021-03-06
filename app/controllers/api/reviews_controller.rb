class Api::ReviewsController < ApplicationController
  
    def index 
      @reviews = Review.all
      render :index
    end
  
    def create
      @review = Review.new(review_params)
     
      # @review.business_id = params[:business_id]
      
      if @review.save
        render :show
      else
        render json: @review.errors.full_messages, status: 422
      end
    end
  
    def update
      @review = Review.find_by(user_id: params[:review][:user_id], business_id: params[:review][:business_id])
      
      if @review.user_id != current_user.id
        render :show
      elsif @review.update_attributes(review_params)
        render :show
      else
        render json: @review.errors.full_messages, status: 422
      end
    end
  
  
    def destroy
      @review = Review.find(params[:id])
  
      if @review
        @review.destroy
        render :show
      else
        render json: @review.errors.full_messages, status: 422
      end
    end
  
    def show
    end
  
    private
  
    def review_params
      params.require(:review).permit(:content, :rating, :business_id, :user_id)
    end
  end
