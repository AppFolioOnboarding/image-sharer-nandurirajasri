require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'Access new image addition form' do
    get new_image_path
    assert_response :success
    assert_select 'h1', 'New Image'
    assert_select 'form', true, 'This page must contain a form'
  end

  test 'Create accepts a valid URL' do
    tags = 'these, are, tags'
    post images_path,
         params: { image: { url: 'https://tinyurl.com/yyh2ey7v', tag_list: tags } }
    assert_redirected_to image_path(Image.last)
    follow_redirect!
    assert_select 'p', 'Successfully saved Image Link!'
    assert_select 'span', tags, 1
  end

  test 'Create throws error for invalid URL' do
    post images_path,
         params: { image: { url: 'this url is not valid', tag_list: 'tag' } }
    assert_response :unprocessable_entity
    assert_select 'p', 'Unable to save Image Link!'
    assert_select 'span', 'Invalid URL. Please try again.'
    assert_select 'form', true, 'This page must contain a form'
  end

  test 'Show displays the image for saved URL' do
    image = Image.create!(url: 'https://tinyurl.com/yyh2ey7v')
    get image_path(image)
    assert_select "img[src='#{image.url}']", count: 1
    assert_select "a[href='#{images_path}']", count: 1
  end

  test 'Show handles invalid id' do
    get image_path(-1)
    assert_redirected_to images_path
    follow_redirect!
    assert_select 'p', 'Invalid id!'
  end

  test 'Index Displays all images' do
    Image.create!(url: 'https://tinyurl.com/123')
    Image.create!(url: 'https://tinyurl.com/456')
    get images_path
    assert_select "a[href='#{new_image_path}']", count: 1
    assert_select 'h4', 'Listing Images'
    assert_select 'img', count: Image.count
  end

  test 'Index Displays all images in reverse order of addition' do
    url1 = 'https://tinyurl.com/123'
    url2 = 'https://tinyurl.com/456'
    Image.create!(url: url1, created_at: Time.zone.now - 10.minutes)
    Image.create!(url: url2, created_at: Time.zone.now - 5.minutes)
    get images_path
    assert_select 'img', count: Image.count
    assert_select 'img' do |images|
      assert_equal url2, images.first.attribute('src').value
      assert_equal url1, images.last.attribute('src').value
    end
  end

  test 'Index works with no images' do
    get images_path
    assert_select 'h1', 'Listing Images'
    assert_select 'td', count: 0
  end
end
