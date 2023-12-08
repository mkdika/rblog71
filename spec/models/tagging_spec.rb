require 'rails_helper'

RSpec.describe Tagging, type: :model do

  it 'disable paper trail' do
    is_expected.to_not be_versioned
  end

  describe 'relation' do
    it 'has belong to' do
      should belong_to(:tag)
      should belong_to(:post)
    end
  end
end
