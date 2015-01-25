class Bean < ActiveRecord::Base

  belongs_to :roaster
  
  has_many :reviews
  has_many :users, :through => :reviews

  validates :name, presence: true
  #validates :roaster_id, presence: true
  
=begin
  def roaster_name
    roaster.try(:name)
  end
=end

  def roaster_name
    self.roaster.try(:id)
  end
  
  def roaster_name=(name)
    self.roaster = Roaster.find_by(name: name) if name.present?
  end
  
=begin
  def roaster_name=(name)
    self.roaster = Roaster.find_or_create_by(name: name) if name.present?
  end
=end

end