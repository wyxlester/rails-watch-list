class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
