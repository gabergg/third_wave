class Review < ActiveRecord::Base
  
  belongs_to :beans
  belongs_to :users

  default_scope -> { order('created_at DESC') }
  validates :rating, presence: true
  #validates :user_id, presence: true
  #validates :bean_id, presence: true

end