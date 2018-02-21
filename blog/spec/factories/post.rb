FactoryGirl.define do
  factory :post do
    title 'title text'
    body 'body text'

    user
  end
end
