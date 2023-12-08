require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'column' do
    it 'has columns' do
      should have_db_column(:name).of_type(:string)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:content).of_type(:text)
    end

    it 'has max length validation' do
      should validate_length_of(:name).is_at_most(50)
      should validate_length_of(:email).is_at_most(100)
    end

    it 'has presence validation' do
      should validate_presence_of :name
      should validate_presence_of :content
    end

    it 'has format validation' do
      should allow_value("mkdika@gmail.com").for(:email)
      should_not allow_value("mkdika_at_gmailcom").for(:email)
    end
  end

  describe 'relation' do
    it 'has belong to' do
      should belong_to(:post)
    end
  end
end
