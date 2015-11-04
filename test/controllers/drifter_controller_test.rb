require 'test_helper'

class DrifterControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get beenTo" do
    get :beenTo
    assert_response :success
  end

  test "should get wishTo" do
    get :wishTo
    assert_response :success
  end

end
