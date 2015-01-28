class Review < ActiveRecord::Base
  

  belongs_to :bean
  belongs_to :user

  default_scope -> { order('created_at DESC') }
  validates :rating, presence: true
  validates :rating, numericality: {less_than_or_equal_to: 5}
  validates :rating, numericality: {greater_than_or_equal_to: 0}

  def rating
    if self[:rating] == 0
      "None"
    else
      self[:rating]
    end
  end

  WillPaginate.per_page = 10
  
end