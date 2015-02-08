class RoastersController < ApplicationController

  before_action :admin_user, only: :destroy

  def index
    #@roasters = Roaster.paginate(page: params[:page], order: 'name ASC')
    @roasters = Roaster.paginate(page: params[:page], order: 'avg_rating DESC')
    @roaster = Roaster.new
  end

  def create
    @roasters = Roaster.paginate(page: params[:page], order: 'name ASC')
    @roaster = Roaster.new(roaster_params)
    if @roaster.save
      flash[:success] = "Roaster Submitted"
      redirect_to roasters_path
    else
      respond_to do |format|
        format.html { render action: "index" }
        format.json { render json: @roaster.errors, status: :unprocessable_entity }
        format.js {}
      end
    end

  end

  def show
    @roaster = Roaster.find(params[:id])
    @beans = @roaster.beans.paginate(page: params[:page], order: 'avg_rating DESC')
  end

  def new
  end

  def destroy
    Roaster.find(params[:id]).destroy
    redirect_to roasters_path
  end

  def update
  end

  def edit
  end

  def autocomplete
    @roasters = Roaster.order(:name).where("name ilike ?", "%#{params[:term]}%")
    render json: @roasters.map(&:name)
  end

  private

  def roaster_params
    params.require(:roaster).permit(:name, :location, :description)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
