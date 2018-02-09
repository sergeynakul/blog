class Category < ApplicationRecord
	has_many :posts, dependent: :destroy

  VALID_NAME_REGEX = /\A[A-Z][a-z]+\s[a-z][a-z]+\.\z/i
  validates :name, presence: true, format: { 
  	with: VALID_NAME_REGEX,
  	message: "at least 2 words in 2 letters, must include '.', the first word in uppercase."
  }
end
