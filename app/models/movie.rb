class Movie < ApplicationRecord
  mount_uploader :poster, PosterUploader
  paginates_per 5

  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :summary, presence: true

  def avg_rating
    return Review.where(movie_id: self.id).average(:rating).to_f.round(1)
  end

  def find_reviews
    return Review.where(movie_id: self.id)
  end

  def movie_reviewed_by_current_user(user_id)
    return false if self.reviews.where(user_id: user_id).count < 2
  end

  def self.search(search)
    if search
      where("summary LIKE ?", "%#{search}%").order("created_at DESC")
    else
      where.not(title: nil)
    end
  end

end
