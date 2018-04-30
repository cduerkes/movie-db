class Movie < ApplicationRecord
  mount_uploader :poster, PosterUploader
  paginates_per 10

  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :summary, presence: true
end
