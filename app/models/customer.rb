class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :outfits, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :question_favorites, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_one_attached :profile_image
  
  enum gender: {その他: 0 , 男性: 1, 女性: 2}
  
  def get_profile_image
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end
end
