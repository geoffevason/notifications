require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'required attributes' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:post) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
    it { should have_many(:likes) }
  end
end
