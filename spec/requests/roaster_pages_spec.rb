require 'spec_helper'

describe "roaster pages" do

  subject { page }

  before { visit roasters_path }

  describe "roaster creation" do
    before { click_button "Add a roaster" }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Submit" }.not_to change(roaster, :count)
      end

      describe "error messages" do
        before { click_button "Submit Roaster" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'roaster_name', with: "Tasty roaster" }
      it "should create a roaster" do
        expect { click_button "Submit Roaster" }.to change(roaster, :count).by(1)
      end
    end
  end
  
  describe "roaster destruction" do
    before { FactoryGirl.create(:user, admin: true) }
    before { FactoryGirl.create(:roaster) }

    describe "as admin" do
      before { visit roasters_path }

      it "should delete a roaster" do
        expect { click_link "Remove" }.to change(roaster, :count).by(-1)
      end
    end
  end
  
  describe "roaster page" do
    let(:roaster) { FactoryGirl.create(:roaster) }
    before { visit roaster_path(roaster) }

    it { should have_content(roaster.name) }
    it { should have_title(roaster.name) }
  end
  
end