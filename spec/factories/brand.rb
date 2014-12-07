FactoryGirl.define do
  factory :brand do
    name        { Faker::Company.name }

    trait :with_product do
      after(:create) do |instance|
        FactoryGirl.create(:product, brand_id: instance.id)
      end
    end
  end
end
