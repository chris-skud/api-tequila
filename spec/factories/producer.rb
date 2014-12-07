FactoryGirl.define do
  factory :producer do
    name        { Faker::Company.name }
    nom         { Faker::Number.number(4)}
    dot         { Faker::Number.number(4)}
    address      { Faker::Address.street_address }
    telephone   { Faker::PhoneNumber.phone_number }

    trait :with_brand do
      after(:create) do |instance|
        FactoryGirl.create(:brand, producer_id: instance.id)
      end
    end
  end
end
