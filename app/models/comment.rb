class Comment < ApplicationRecord
  
  belongs_to :post

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: true, message: 'Email format is not valid' } 
  validates :name, :content, presence: true
  validates :name, length: { maximum: 50 }
  validates :email, length: { maximum: 100 }

end
