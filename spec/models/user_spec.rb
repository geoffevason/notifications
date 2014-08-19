describe User do

  before(:each) { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    @user = FactoryGirl.build(:user, email: 'user@example.com')
    expect(@user.email).to match 'user@example.com'
  end

  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { should have_many(:likes) }

end
