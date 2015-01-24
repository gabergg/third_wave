class Review < ActiveRecord::Base
  
  belongs_to :bean
  belongs_to :user

  default_scope -> { order('created_at DESC') }
  validates :rating, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates :rating, numericality: { greater_than: 0 }

end