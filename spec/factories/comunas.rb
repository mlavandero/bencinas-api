# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comuna do
    sequence(:nombre){ |n| "Comuna #{n}" }
  end
end
