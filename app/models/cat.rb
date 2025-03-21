class Cat < ApplicationRecord
 belongs_to :user
 has_one_attached :profile_image
 validates :title, presence: true
 validates :body, presence: true, length: { maximum: 150 }
 has_many :post_images, dependent: :destroy
end
