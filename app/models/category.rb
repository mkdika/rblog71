class Category < ApplicationRecord

  has_paper_trail

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }

end
