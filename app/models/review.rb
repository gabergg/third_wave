class Review < ActiveRecord::Base
  
  belongs_to :beans
  belongs_to :users

  default_scope -> { order('review_date DESC') }
  validates :rating, presence: true

end