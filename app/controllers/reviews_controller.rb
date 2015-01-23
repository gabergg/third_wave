class ReviewsController < ApplicationController

  def index
  end

  def create
    @review = Review.new(review_params)
    @review[:bean_id] = params[:bean_id]
    @review[:user_id] = params[:user_id]

    if @review.save
      flash[:success] = "Review Submitted"
      redirect_to beans_path
    else
      render 'new'
    end
  end

  def show
  end

  def new
    @review = Review.new(bean_id: params[:bean_id], user_id: current_user.id)
  end

  def destroy
  end

  def update
  end

  def edit
  end
  
  private

  def review_params
    params.require(:review).permit(:rating, :brew_method, :description, :user_id, :bean_id)
  end

end
