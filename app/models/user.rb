class User < ActiveRecord::Base
  
  has_many :reviews
  has_many :beans, :through => :reviews

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  #Note that presence validation for password and password_confirmation are added by has_secure_password

  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  scope :name_like, -> (name) { where("name ilike ?", "%#{name}%") }

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
