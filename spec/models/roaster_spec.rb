require 'spec_helper'

describe Roaster do

  let(:roaster) { FactoryGirl.create(:roaster) }
  #before { @micropost = user.microposts.build(content: "Lorem ipsum") }

  subject { @roaster }

  it { should respond_to(:name) }
  it { should respond_to(:location) }
  it { should respond_to(:avg_rating) }

  it { should be_valid }

  describe "when name is not present" do
    before { @roaster.name = nil }
    it { should_not be_valid }
  end

end