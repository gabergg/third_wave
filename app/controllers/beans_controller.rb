class BeansController < ApplicationController

  before_filter :admin_user, only: :destroy

  def index
    @beans = Bean.paginate(page: params[:page], order: 'avg_rating DESC')
    @bean = Bean.new
  end

  def create
    @beans = Bean.paginate(page: params[:page], order: 'avg_rating DESC')
    @bean = Bean.new(bean_params)
    if @bean.save
      flash[:success] = "Bean Submitted"
      redirect_to beans_path
    else
      respond_to do |format|
        format.html { render action: "index" }
        format.json { render json: @bean.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def show
    @bean = Bean.find(params[:id])
    @bean_reviews = @bean.reviews
  end

  def new
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

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
