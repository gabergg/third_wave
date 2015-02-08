class Roaster < ActiveRecord::Base

  has_many :beans

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def avg_rating
    if self[:avg_rating] == 0
      "None"
    else
      self[:avg_rating].round(2)
    end
  end

  def avg_rating_num
    self[:avg_rating].round(2)
  end

  scope :name_like, -> (name) { where("name ilike ?", "%#{name}%") }

end