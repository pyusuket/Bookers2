class Book < ApplicationRecord
    has_one_attached :image
    validates :title, presence: true
    validates :body, presence: true
    belongs_to :user
    
    def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
  
end
