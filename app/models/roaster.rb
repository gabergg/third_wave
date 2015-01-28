class Roaster < ActiveRecord::Base
  
  has_many :beans

  validates :name, presence: true

  def avg_rating
    if self[:avg_rating] == 0
      "None"
    else
      self[:avg_rating]
    end
  end

  scope :name_like, -> (name) { where("name ilike ?", "%#{name}%") }

end