class Movie < ApplicationRecord
  mount_uploader :poster, PosterUploader
  belongs_to :user
  validates :title, presence: true
  validates :summary, presence: true
end
