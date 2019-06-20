class Image < ApplicationRecord
  validates :url, url: { message: 'Invalid URL. Please try again.' }
end
