require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'Access new image addition form' do
    get new_image_path
    assert_response :success
    assert_select 'h1', 'New Image'
    assert_select 'form', true, 'This page must contain a form'
  end

  test 'Create accepts a valid URL' do
    post images_path,
         params: { image: { url: 'https://tinyurl.com/yyh2ey7v' } }
    assert_redirected_to image_path(Image.last)
  end

  test 'Create throws error for invalid URL' do
    post images_path,
         params: { image: { url: 'this url is not valid' } }
    assert_response :unprocessable_entity
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

  test 'Index displays all images' do
    Image.create!(url: 'https://tinyurl.com/yyh2ey7v')
    Image.create!(url: 'https://tinyurl.com/yyh2ey7v')
    get images_path
    assert_select 'h1', 'Listing Images'
    assert_select 'table', count: 1
    assert_select 'td', count: 4
    assert_select "a[href='#{new_image_path}']", count: 1
  end

  test 'Index works with no images' do
    get images_path
    assert_select 'h1', 'Listing Images'
    assert_select 'td', count: 0
  end
end
