class Bean < ActiveRecord::Base

  has_many :reviews

  default_scope -> { order('review_date DESC') }
  validates :name, presence: true
  validates :roaster, presence: true

end