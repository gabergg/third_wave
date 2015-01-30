require 'spec_helper'

describe "Pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Third Wave') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:roaster)
        FactoryGirl.create(:bean, roaster: roaster)
        FactoryGirl.create(:review, user: user, bean: bean, rating: 3)
        FactoryGirl.create(:review, user: user, bean: bean, rating: 4)
        FactoryGirl.create(:review, user: user, bean: bean, rating: 5)
        sign_in user
        visit root_path
      end

      # pick up here
      
=begin
      it "should render the user's reviews" do
        user.reviews.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
=end
    end
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end
  
end