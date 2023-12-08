class Post < ApplicationRecord

  has_paper_trail

  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :taggings

  validates :title, :content, presence: true
  validates :title, length: { maximum: 100 }

  before_save :permalink

  def permalink
    self.permalink = "#{title.strip.downcase.gsub " ", "-"}"
  end

end
