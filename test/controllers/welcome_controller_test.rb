require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'can see the welcome page' do
    get root_path
    assert_select 'h2', 'Hello World'
  end
end
