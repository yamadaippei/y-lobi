require 'test_helper'

class LobiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lobi_index_url
    assert_response :success
  end

end
