class ReviewsController < ApplicationController

  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def index
    @reviews = Review.paginate(page: params[:page],order: 'created_at DESC')
  end

  def create
    @review = Review.new(review_params)
    @review[:bean_id] = params[:bean_id]
    @review[:user_id] = params[:user_id]

    if @review.save
      flash[:success] = "Review Submitted"
      unless @review.rating == "None"
        @bean = Bean.find_by(id: @review[:bean_id])
        @bean.update(avg_rating: (@bean.avg_rating_num*@bean.num_ratings + @review.rating)/(@bean.num_ratings+1))
        @bean.update(num_ratings: @bean.num_ratings + 1)
        @roaster = Roaster.find_by(id: @bean[:roaster_id])
        @roaster.update(avg_rating: (@roaster.avg_rating_num*@roaster.num_ratings + @review.rating)/@roaster.num_ratings+1)
        @roaster.update(num_ratings: @roaster.num_ratings + 1)
      end
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
    Review.find(params[:id]).destroy
    redirect_to root_path
  end

  def update
  end

  def edit
  end

  private

  def review_params
    params.require(:review).permit(:rating, :brew_method, :description, :user_id, :bean_id)
  end
  
  #Before filters

  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    redirect_to root_url if @review.nil?
  end

end

2
4
num = 2
avg = 3
5

11/3