FactoryBot.define do
  factory :comment do
    author "Test Author."
    content "MyText"
    commentable_id 1
    commentable_type "Category"
  end
end
