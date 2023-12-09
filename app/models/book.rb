class Book < ApplicationRecord
    has_one_attached :image
    validates :title, presence: true
    validates :body, presence: true
    belongs_to :user
end
