class PagesController < ApplicationController

  def home

    if signed_in?
      @user_reviews = current_user.reviews
    end

  end
  
  def autocomplete
    @beans = Bean.name_like(params[:search])
    @roasters = Roaster.name_like(params[:search])
    @users = User.name_like(params[:search])
    render 'shared/search_results'
  end

end
