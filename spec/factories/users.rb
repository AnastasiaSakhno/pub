FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@email.com" }
    name 'some user name'
    middle_name 'some user middle name'
    last_name 'some user last name'
    password "123456"

    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end

    factory :employee do
      after(:create) {|user| user.add_role(:employee)}
    end
  end
end