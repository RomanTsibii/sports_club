FactoryBot.define do
  factory :subscription do
    name { "MyString" }
    training { 1 }
    validity { "2020-03-19" }
    price { "9.99" }
  end
end
