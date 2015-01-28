class PagesController < ApplicationController

  def home

    if signed_in?
      @user_reviews = current_user.reviews
    end

  end

  def autocomplete

    p params[:term]

    @beans = Bean.name_like(params[:term]).map(&:name)
    @roasters = Roaster.name_like(params[:term]).map(&:name)
    @users = User.name_like(params[:term]).map(&:name)


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
