class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :outfits, dependent: :destroy
  has_one_attached :profile_image
  def get_profile_image
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end
end
