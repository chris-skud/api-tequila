FactoryGirl.define do
  factory :product do
    name        { Faker::Company.name }
    style       { Faker::Commerce.product_name }
  end
end
