class Film < ApplicationRecord

  has_one_attached :poster

  has_and_belongs_to_many :countries
  has_and_belongs_to_many :genres

  validates_length_of :title, minimum: 1, maximum: 255
  validates_length_of :title_localized, minimum: 1, maximum: 255
  validates_numericality_of :rating, greater_than_or_equal_to: 0, less_than_or_equal_to: 10
  validates_presence_of :year
  validates :poster, content_type: [:png, :jpg, :jpeg]

  scope :filtered_by, ->(params) {
    result = self

    if params[:title].present?
      title = ['%', params[:title], '%'].join
      result = result.where('title ilike ? OR title_localized ilike ?', title, title)
    end

    if params[:country_id]
      result = result.joins(:countries).where('countries.id = ?', params[:country_id])
    end

    if params[:genre_ids].present?
      result = result.joins(:genres).where('genres.id IN (?)', params[:genre_ids])
    end

    result.where(params.slice(:year, :rating))
  }

  scope :ordered_by, ->(params) {
    field = params[:sort_field]
    field = :id unless field.to_s.downcase.in?(['year', 'rating'])

    direction = params[:sort_direction]
    direction = :asc unless direction.to_s.downcase.in?(['asc', 'desc'])

    order(field => direction)
  }

end
