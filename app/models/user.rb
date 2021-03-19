class User < ApplicationRecord
  before_save :format_username

  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie

  validates :username, presence: true,
                     format: { with: /\A[A-Z0-9]+\z/i },
                     uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :email, format: { with: /\S+@\S+/ },
                    uniqueness: { case_sensitive: false }
  
  scope :by_name, -> { order(:name) }
  scope :not_admins, -> { by_name.where(admin: false) }
  
  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  def to_param
    username.parameterize
  end

  private

  def format_username
    self.username = username.downcase
  end
end