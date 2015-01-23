class Bean < ActiveRecord::Base

  has_many :reviews
  has_many :users, :through => :reviews

  validates :name, presence: true
  validates :roaster, presence: true

end