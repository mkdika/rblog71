class Tag < ApplicationRecord

  has_paper_trail
    
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }

end
