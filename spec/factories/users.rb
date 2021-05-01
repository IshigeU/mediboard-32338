FactoryBot.define do
  factory :user do
    name                   {'テスト'}
    email                  {Faker::Internet.free_email}
    password               {'000aaa'}
    password_confirmation  {'000aaa'}
  end
end
