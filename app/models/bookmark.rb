class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie, :list, presence: true
  validates :comment, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list, message: "is already in the list" }
end
