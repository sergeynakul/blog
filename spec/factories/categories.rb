FactoryBot.define do
  factory :category do
    name "Category one."
    description "MyText"
  end

  factory :invalid_category, class: "Category" do
    name nil
    description "MyText"
  end
end
