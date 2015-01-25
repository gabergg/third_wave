class Roaster < ActiveRecord::Base
  
  has_many :beans

  validates :name, presence: true

end