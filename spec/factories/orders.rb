FactoryGirl.define do
  factory :order do
    number "MyString"
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    shopify_order_id 1
    order_date "2016-04-16 09:49:02"
    total 1.5
    line_item_count 1
    financial_status "MyString"
  end
end
