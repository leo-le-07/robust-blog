require 'test_helper'

class MyBlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_blogs_index_url
    assert_response :success
  end

end
