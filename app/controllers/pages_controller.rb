class PagesController < ApplicationController

  def home

    if signed_in?
      @user_reviews = current_user.reviews
    end

  end
  
  def autocomplete
    
  end

end
