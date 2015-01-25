class RoastersController < ApplicationController

  def index
    @roasters = Roaster.all
    @roaster = Roaster.new
  end

  def create
    @roaster = Roaster.new(roaster_params)
    if @roaster.save
      flash[:success] = "Roaster Submitted"
      redirect_to roasters_path
    else
      render 'new'
    end
  end

  def show
    @roaster = Roaster.find(params[:id])
  end

  def new
    @roaster = Roaster.new
  end

  def destroy
    Roaster.find(params[:id]).destroy
    redirect_to roasters_path
  end

  def update
  end

  def edit
  end
  
  def autocomplete_index
    @roasters = Roaster.order(:name).where("name ilike ?", "%#{params[:term]}%")
    render json: @roasters.map(&:name)
  end

  private

  def roaster_params
    params.require(:roaster).permit(:name, :location, :description)
  end

end
