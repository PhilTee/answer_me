class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user
  
  scope :ordered, -> { order(id: :desc) }

  validates :body, :title, presence: true
end
