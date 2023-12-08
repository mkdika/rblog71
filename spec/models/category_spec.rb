require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'column' do
    it 'has columns' do
      should have_db_column(:name).of_type(:citext)
    end

    it 'has max length validation' do
      should validate_length_of(:name).is_at_most(100)
    end

    it 'has presence validation' do
      should validate_presence_of :name
    end

    it 'has uniqueness validation' do
      should validate_uniqueness_of(:name).case_insensitive
    end
  end

  it 'enables paper trail' do
    is_expected.to be_versioned
  end
end
