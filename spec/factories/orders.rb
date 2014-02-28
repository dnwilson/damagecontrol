# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    cart_id 1
    user 1
    ip_address "MyString"
    first_name "MyString"
    last_name "MyString"
    card_type "MyString"
    card_expires_on "2014-02-28"
    billing_address "MyString"
    shipping_address "MyString"
  end
end
