FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@email.com" }
    password "123456"

    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end

    factory :employee do
      after(:create) {|user| user.add_role(:employee)}
    end
  end
end