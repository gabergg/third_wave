class PagesController < ApplicationController

  def home

    if signed_in?
      @user_reviews = current_user.reviews
    end

  end

  def autocomplete
    unless params[:search].nil? || params[:search].empty?
      @beans = Bean.name_like(params[:search])
      @roasters = Roaster.name_like(params[:search])
      @users = User.name_like(params[:search])
      render 'shared/search_results'
    else
      render 'shared/no_search_params'
    end
  end

end
