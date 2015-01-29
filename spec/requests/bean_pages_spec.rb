require 'spec_helper'

describe "Bean pages" do

  subject { page }

  before { visit beans_path }

  describe "bean creation" do
    before { click_button "Add a bean" }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Submit" }.not_to change(Bean, :count)
      end

      describe "error messages" do
        before { click_button "Submit" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'bean_name', with: "Tasty Bean" }
      it "should create a bean" do
        expect { click_button "Post" }.to change(Bean, :count).by(1)
      end
    end
  end

  describe "bean destruction" do
    before { FactoryGirl.create(:user, admin: true) }
    before { FactoryGirl.create(:bean) }

    describe "as admin" do
      before { visit beans_path }

      it "should delete a bean" do
        expect { click_link "Remove" }.to change(Bean, :count).by(-1)
      end
    end
  end

  describe "bean page" do
    let(:bean) { FactoryGirl.create(:bean) }
    before { visit bean_path(bean) }

    it { should have_content(bean.name) }
    it { should have_title(bean.name) }
  end
end