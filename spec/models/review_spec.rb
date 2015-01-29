require 'spec_helper'

describe Review do

  let(:user) { FactoryGirl.create(:user) }
  let(:bean) { FactoryGirl.create(:bean) }
  before { @review = user.reviews.build(rating: 3, description: "yummy delicious", brew_method: "pour over", bean_id: bean.id) }

  subject { @review }

  it { should respond_to(:rating) }
  it { should respond_to(:brew_method) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:bean_id) }
  it { should respond_to(:bean) }
  its(:user) { should eq user }
  its(:bean) { should eq bean }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @review.user_id = nil }
    it { should_not be_valid }
  end

  describe "when bean_id is not present" do
    before { @review.bean_id = nil }
    it { should_not be_valid }
  end
  
end