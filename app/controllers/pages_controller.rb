class PagesController < ApplicationController
  
  def home
    if signed_in?
      @user_reviews = Review.where(:user_id => current_user.id)
    end
  end
  
end
