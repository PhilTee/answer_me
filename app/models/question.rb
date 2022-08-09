class Question < ApplicationRecord
  has_many :answers
  scope :ordered, -> { order(id: :desc) }

  validates :body, :title, presence: true
end
