require 'spec_helper'

describe Bean do

  let(:bean) { FactoryGirl.create(:bean) }
  #before { @bean = user.microposts.build(content: "Lorem ipsum") }

  subject { @bean }

  it { should respond_to(:avg_rating) }
  it { should respond_to(:num_ratings) }
  it { should respond_to(:name) }
  it { should respond_to(:roast) }
  it { should respond_to(:roaster) }
  it { should respond_to(:origin) }
  #its(:roaster) { should eq roaster }

  it { should be_valid }

  describe "when roaster_id is not present" do
    before { @bean.roaster_id = nil }
    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @bean.name = nil }
    it { should_not be_valid }
  end

end