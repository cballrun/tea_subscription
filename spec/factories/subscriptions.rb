require 'faker'



FactoryBot.define do
  factory :subscription do
    title { Faker::GreekPhilosophers.name }
    price { Faker::Number.decimal(l_digits: 2) }
    frequency { Faker::Adjective.positive }
 
  end
end 