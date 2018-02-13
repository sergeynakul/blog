class Comment < ApplicationRecord
	belongs_to :commentable, polymorphic: true

  VALID_NAME_REGEX = /\A[A-Z][a-z]+(\s[A-Z][a-z]+)+\.\z/i
  validates :author, presence: true, format: { with: VALID_NAME_REGEX,
	message: "at least 2 words in 2 letters, each first letter in uppercase, must include at the end '.'" }
  validates :content, presence: true
end
