class Answer < ApplicationRecord
  belongs_to :question

  scope :ordered, -> { order(id: :desc) }

  validates :body, presence: true
end
