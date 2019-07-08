require 'test_helper'
require 'json'

class FeedbackControllerTest < ActionDispatch::IntegrationTest
  name = 'my name'

  test 'response should contain the name submitted' do
    post api_feedbacks_path, as: :json, params: { name: name }
    assert_response :success
    assert_equal name, JSON.parse(response.body)['name']
  end

  test 'throw a bad request error for empty names' do
    post api_feedbacks_path, as: :json, params: { name: nil }
    assert_response :bad_request
  end
end
