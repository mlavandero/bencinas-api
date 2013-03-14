require 'factory_girl'

FactoryGirl.define do
  factory :combustible do
    sequence(:nombre){|n| "Combustible #{n}"}
  end
end