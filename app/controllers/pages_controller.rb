class PagesController < ApplicationController

  def home

    if signed_in?
      @user_reviews = current_user.reviews
    end

  end

  def autocomplete

    #@beans = Bean.name_like(params[:term]).map(&:name)
    @beans = Bean.name_like(params[:term]).collect{ |bean| Hash["label", bean.name, "category", "Beans"]}
    @roasters = Roaster.name_like(params[:term]).collect{ |roaster| Hash["label", roaster.name, "category", "Roasters"]}
    @users = User.name_like(params[:term]).collect{ |user| Hash["label", user.name, "category", "Users"]}

    render json: @beans.concat(@roasters.concat(@users))

  end

  def complete_search

    @beans = Bean.name_like(params[:search])
    @roasters = Roaster.name_like(params[:search])
    @users = User.name_like(params[:search])

    unless params[:search].nil? || params[:search].empty?
      render 'shared/search_results'
    else
      render 'shared/no_search_params'
    end

  end

end
