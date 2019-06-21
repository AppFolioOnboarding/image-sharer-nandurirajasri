require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'Empty URL should not be saved' do
    image = Image.new
    assert_not image.save, 'Saved an empty URL'
  end

  test 'Invalid URL should not be saved' do
    image = Image.new
    image.url = 'hello'
    assert_not image.save, 'Saved an invalid URL'
  end

  test 'Saves the URL' do
    get '/images/new'
    assert_response :success
    post '/images',
         params: { image: { url: 'https://tinyurl.com/yyh2ey7v' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'i', 'Successfully saved Image Link!'
  end

  test 'Shows error for invalid URL' do
    get '/images/new'
    assert_response :success
    post '/images',
         params: { image: { url: 'this url is not valid' } }
    assert_select 'p', 'Invalid URL. Please try again.'
  end
end
