class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :outfit
  
  validates :comment, presence: true
end
