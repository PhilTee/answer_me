class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  scope :ordered, -> { order(id: :desc) }

  validates :body, presence: true
end
