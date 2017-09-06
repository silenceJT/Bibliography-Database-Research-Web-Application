require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Bibliography Database Research"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Bibliography Database Research"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Bibliography Database Research"
  end

end
