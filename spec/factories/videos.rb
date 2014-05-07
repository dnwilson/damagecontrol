# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    name "MyString"
    description "MyText"
    event_id 1
    date "2014-05-05"
    new "MyString"
    index "MyString"
    create "MyString"
    destroy "MyString"
  end
end
