class Cat < ApplicationRecord
 belongs_to :user
 has_one_attached :image
 validates :title, presence: true
 validates :body, presence: true, length: { maximum: 150 }
 

 def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end  
end


