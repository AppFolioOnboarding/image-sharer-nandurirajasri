class Image < ApplicationRecord
  validates :url, url: { message: 'Invalid URL. Please try again.' }
  acts_as_taggable_on :tags
end
