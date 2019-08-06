class Film < ApplicationRecord

  has_one_attached :poster

  has_and_belongs_to_many :countries
  has_and_belongs_to_many :genres

  validates_length_of :title, minimum: 5, maximum: 255
  validates_length_of :title_localized, minimum: 5, maximum: 255
  validates_numericality_of :rating, greater_than_or_equal_to: 0, less_than_or_equal_to: 10
  validates_presence_of :year
  validates :poster, content_type: [:png, :jpg, :jpeg]

end
