class Genre < ApplicationRecord
  before_save :set_slug

  has_many :classifications, dependent: :destroy
  has_many :movies, through: :classifications
  validates :name, presence: true, uniqueness: true

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = name.parameterize
  end
end
