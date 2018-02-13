class Category < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, as: :commentable

  VALID_NAME_REGEX = /\A[A-Z][a-z]+(\s[a-z][a-z]+)+\.\z/i
  validates :name, presence: true, format: { with: VALID_NAME_REGEX,
  	message: "must have at least 2 words in 2 letters, include at the end '.' and the first letter in uppercase." }
end
