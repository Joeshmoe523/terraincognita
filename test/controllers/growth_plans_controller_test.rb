require "test_helper"

class GrowthPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get growth_plans_index_url
    assert_response :success
  end

  test "should get new" do
    get growth_plans_new_url
    assert_response :success
  end

  test "should get edit" do
    get growth_plans_edit_url
    assert_response :success
  end
end
