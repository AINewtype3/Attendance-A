require 'test_helper'

class AppliesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get applies_create_url
    assert_response :success
  end

end
