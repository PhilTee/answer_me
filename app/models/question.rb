class Question < ApplicationRecord
  scope :ordered, -> { order(id: :desc) }

  validates :body, :title, presence: true
end
