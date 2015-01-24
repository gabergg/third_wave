class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review[:bean_id] = params[:bean_id]
    @review[:user_id] = params[:user_id]
    
    @bean = Bean.find_by(id: @review[:bean_id])
    @bean.update(num_ratings: @bean.num_ratings + 1)
    @bean.update(avg_rating: (@bean.avg_rating + @review.rating)/@bean.num_ratings)
    
    if @review.save
      flash[:success] = "Review Submitted"
      redirect_to beans_path
    else
      render 'new'
    end
  end

  def show
    @review = Review.find(params[:id])
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
