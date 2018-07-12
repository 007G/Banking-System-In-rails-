require 'test_helper'

class BenificiariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get benificiaries_index_url
    assert_response :success
  end

  test "should get show" do
    get benificiaries_show_url
    assert_response :success
  end

end
