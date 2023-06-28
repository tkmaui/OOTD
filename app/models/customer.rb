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

  validates :nickname, presence: true

  enum gender: {その他: 0 , 男性: 1, 女性: 2}

  def get_profile_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
     profile_image.variant(resize_to_limit: [width, height]).processed
  end


end
