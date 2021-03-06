require 'rails_helper'

RSpec.describe Notification, type: :model do
  context 'required attributes' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:source_user) }
    it { should validate_presence_of(:source_object) }
    it { should validate_presence_of(:notification_type) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:source_user) }
    it { should belong_to(:source_object) }
  end
end
