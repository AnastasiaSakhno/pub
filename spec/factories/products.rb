FactoryGirl.define do
  factory :product do
    name "some product name"
    description "some product description"
    incoming_price 1.5
    sale_price 2.5
    total_count 100
    amount_per_one 4.5
    measure Constants::Measure::KILO
  end
end
