FactoryGirl.define do
  factory :product do
    name "some name"
    description "some description"
    incoming_price 1.5
    sale_price 2.5
    total_count 3.5
    amount_per_one 4.5
    measure_id 1
  end
end
