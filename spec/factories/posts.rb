FactoryBot.define do
  factory :post do
    name "Test post."
    content "MyText"
    file "MyString"
    category_id 1
  end
end
