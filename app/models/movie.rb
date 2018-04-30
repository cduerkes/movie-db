class Movie < ApplicationRecord
  mount_uploader :poster, PosterUploader
  paginates_per 10

  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :summary, presence: true

  def self.search(search)
    where("title ILIKE ? OR summary ILIKE ?", "%#{search}%", "%#{search}%") 
  end

  def avg_rating
    return Review.where(movie_id: self.id).average(:rating).to_f
  end

end
