# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_facebook, :class => 'User::Facebook' do
    user
    uid { generate(:uid) }
  end
end
