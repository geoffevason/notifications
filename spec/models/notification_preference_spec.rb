require 'rails_helper'

RSpec.describe NotificationPreference, type: :model do
  context 'required attributes' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:notification_type) }
  end

  context 'associations' do
    it { should belong_to(:user) }
  end
end
