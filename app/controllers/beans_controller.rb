class BeansController < ApplicationController

  def index
    @beans = Bean.all
    @bean = Bean.new
  end

  def create
    @bean = Bean.new(bean_params)
    if @bean.save
      flash[:success] = "Bean Submitted"
      redirect_to beans_path
    else
      render 'new'
    end
  end

  def show
    @bean = Bean.find(params[:id])
    @bean_reviews = @bean.reviews
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
  
  def roaster_name
    roaster.try(:name)
  end

  def roaster_name=(name)
    self.roaster = Roaster.find_by_name(name) if name.present?
  end

  private

  def bean_params
    params.require(:bean).permit(:roaster_name, :roaster_id, :name, :origin, :roast)
  end

end
