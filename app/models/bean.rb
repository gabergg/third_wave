class Bean < ActiveRecord::Base

  has_many :reviews

  validates :name, presence: true
  validates :roaster, presence: true

end