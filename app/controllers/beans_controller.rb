class BeansController < ApplicationController

  def index
    @beans = Bean.all
  end

  def create
    @bean = Bean.new(bean_params)
    if @bean.save
      flash[:success] = "Review Submitted"
      redirect_to beans_path
    else
      render 'new'
    end
  end

  def show
  end

  def new
    @bean = Bean.new
  end

  def destroy
    Bean.find(params[:id]).destroy
    redirect_to beans_path
  end

  def update
  end

  def edit
  end

  private

  def bean_params
    params.require(:bean).permit(:name, :roaster, :origin, :location, :roast, :rating, :description, :review_date)
  end

end
