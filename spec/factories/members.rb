FactoryBot.define do
  factory :member do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }
    password { 'ChangeMeAsap' }
    password_confirmation { 'ChangeMeAsap' }
  end
end
