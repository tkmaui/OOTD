class Answer < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  belongs_to :question

  validates :answer, presence: true
end
