describe User do

  before(:each) { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    @user = FactoryGirl.build(:user, email: 'user@example.com')
    expect(@user.email).to match 'user@example.com'
  end

  it { should have_many(:posts) }
  it { should have_many(:notifications) }
  it { should have_many(:notification_preferences) }

  it { should have_many(:likes) }
  it { should have_many(:comments) }
end
