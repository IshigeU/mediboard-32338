FactoryBot.define do
  factory :tweet do
    title {Faker::Lorem.sentence}
    text  {Faker::Lorem.sentence}
    association :user 
  end
end