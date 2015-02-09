class Bean < ActiveRecord::Base

  belongs_to :roaster
  
  has_many :reviews
  has_many :users, :through => :reviews

  #validates :name, uniqueness: { case_sensitive: false }
  validates :roaster_name, presence: true

  def roaster_name
    roaster.try(:name)
  end
  
  def roaster_name=(name)
    self.roaster = Roaster.find_or_create_by(name: name) if name.present?
  end

  def avg_rating
    if self[:avg_rating] == 0
      "None"
    else
      self[:avg_rating].round(2)
    end
  end

  def avg_rating_num
    self[:avg_rating]
  end

  scope :name_like, -> (name) { where("name ilike ?", "%#{name}%") }
  
=begin
  def roaster_name=(name)
    self.roaster = Roaster.find_or_create_by(name: name) if name.present?
  end
=end

end