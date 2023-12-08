require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'column' do
    it 'has columns' do
      should have_db_column(:permalink).of_type(:string)
      should have_db_column(:title).of_type(:string)
      should have_db_column(:content).of_type(:text)
      should have_db_column(:release).of_type(:boolean)
      should have_db_column(:release_date).of_type(:datetime)
      should have_db_column(:category_id).of_type(:integer)
    end

    it 'has extra indexes' do
      should have_db_index [:permalink]
      should have_db_index [:release_date]
    end

    it 'has max length validation' do
      should validate_length_of(:title).is_at_most(100)
    end

    it 'has presence validation' do
      should validate_presence_of :title
      should validate_presence_of :content
    end
  end

  it 'enables paper trail' do
    is_expected.to be_versioned
  end

  describe 'relation' do
    it 'has belong to' do
      should belong_to(:category)
    end

    it 'has have_many' do
      should have_many(:taggings).class_name('Tagging')
      should have_many(:tags).class_name('Tag').through(:taggings)
      should have_many(:comments).class_name('Comment').dependent(:destroy)
    end
  end

  describe '#permalink' do
    context 'given valid title' do
      let(:dummy_post) { create :post, title: 'Ruby is Awesome' }
      it 'should generate valid permalink' do
        expect(dummy_post.permalink).to eq 'ruby-is-awesome'
      end
    end

    context 'given blank between title' do
      let(:dummy_post) { create :post, title: '  Ruby is Awesome  ' }
      it 'should strip blank char and generate valid permalink' do
        expect(dummy_post.permalink).to eq 'ruby-is-awesome'
      end
    end
  end
end
