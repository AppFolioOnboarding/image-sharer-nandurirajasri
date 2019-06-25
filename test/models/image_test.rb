require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'Empty URL should not be saved' do
    image = Image.new
    assert_not_predicate image, :valid?
    assert image.errors.added? :url, 'Invalid URL. Please try again.'
  end

  test 'Invalid URL should not be saved' do
    image = Image.new
    image.url = 'hello'
    assert_not_predicate image, :valid?
    assert image.errors.added? :url, 'Invalid URL. Please try again.'
  end

  test 'Save a valid URL' do
    image = Image.new
    image.url = 'https://tinyurl.com/yyh2ey7v'
    assert_predicate image, :valid?
  end

  test 'Save a URL with tags' do
    image = Image.new
    image.url = 'https://tinyurl.com/yyh2ey7v'
    image.tag_list = 'testing, tags'
    assert_predicate image, :valid?
  end

  test 'Save URL with empty tags' do
    image = Image.new
    image.url = 'https://tinyurl.com/yyh2ey7v'
    assert_predicate image, :valid?
  end
end
