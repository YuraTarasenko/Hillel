FactoryGirl.define do
  factory :comment do
    body 'text'

    post
    user
  end
end
