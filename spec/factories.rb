FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :roaster do
    sequence(:name)  { |n| "Roaster #{n}" }
    location "Saline, MI, USA"
    description "Roasting, toasting, and boasting the most."
  end

  factory :bean do
    sequence(:name)  { |n| "Bean #{n}" }
    origin "Ethiopia"
    roaster
  end
  
  factory :review do 
    rating 3.5
    brew_method "Pour over"
    description "Juniper, apricot, dry finish"
    user
    bean
  end
  
end