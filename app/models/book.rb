class Book < ApplicationRecord
    has_one_attached :image
    validates :title, presence: true
    validates :body, presence: true, length: {maximum: 200}
    belongs_to :user
    
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
