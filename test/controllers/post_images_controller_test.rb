require "test_helper"

class PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get post_images_top_url
    assert_response :success
  end
end
