class Post < ApplicationRecord
  belongs_to :category

  mount_uploader :file, FileUploader

  validates :file, file_size: { less_than_or_equal_to: 2.megabytes,
    message: "size must be less than or equal to 2 MB" }, allow_nil: true
  VALID_NAME_REGEX = /\A[A-Z][a-z]+\s[a-z][a-z]+\.\z/i
  validates :name, presence: true, format: { with: VALID_NAME_REGEX,
  	message: "must have at least 2 words in 2 letters, include at the end '.' and the first word in uppercase." }
end
