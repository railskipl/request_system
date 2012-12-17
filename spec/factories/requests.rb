# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    phone_no 1
    request_type "MyString"
    details_of_request "MyText"
    permission false
    status "MyString"
  end
end
