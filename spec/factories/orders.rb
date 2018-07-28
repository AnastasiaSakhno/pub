FactoryGirl.define do
  factory :order do
    seller_id 1
    client_name "client name"
    datetime Time.zone.now
    table_number 1
  end
end
