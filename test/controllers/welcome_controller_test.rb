require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'can see the welcome page' do
    get root_path
    assert_select 'h2', 'Hello World'
  end
  test 'Can see the link for saving images on Welcome' do
    get root_path
    assert_select 'a', 'Save Image Links'
  end
end
