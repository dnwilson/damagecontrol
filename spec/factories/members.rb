# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    name "MyString"
    title ""
    bio "MyText"
    facebook "MyString"
    twitter "MyString"
    instagram "MyString"
    soundcloud "MyString"
    reverbnation "MyString"
    youtube "MyString"
  end
end
