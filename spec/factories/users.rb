FactoryBot.define do
  factory :user do
    name                   {'ใในใ'}
    email                  {Faker::Internet.free_email}
    password               {'000aaa'}
    password_confirmation  {'000aaa'}
  end
end
