class Movie < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :summary, presence: true
end
