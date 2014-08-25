require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'required attributes' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:likeable) }
  end

  context 'associations' do
    it { should belong_to(:user) }
  end
end
