# spec/factories/triggers.rb
FactoryBot.define do
  factory :trigger do
    body { Faker::Lorem.paragraphs.first }
    to { Faker::Number.number }
  end
end
