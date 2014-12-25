class Bean < ActiveRecord::Base

  default_scope -> { order('review_date DESC') }
  validates :name, presence: true
  validates :roaster, presence: true

end