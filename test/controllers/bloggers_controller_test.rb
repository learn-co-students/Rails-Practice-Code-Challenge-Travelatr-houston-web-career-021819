require 'test_helper'

class BloggersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bloggers_new_url
    assert_response :success
  end

end
