class Question < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :answers, dependent: :destroy
  has_many :question_favorites, dependent: :destroy

  validates :title, presence: true
  validates :caption, presence: true


  def favorited_by?(customer)
    question_favorites.exists?(customer_id: customer.id)
  end
end
