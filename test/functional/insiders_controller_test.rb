require 'test_helper'

class InsidersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insiders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insider" do
    assert_difference('Insider.count') do
      post :create, :insider => { }
    end

    assert_redirected_to insider_path(assigns(:insider))
  end

  test "should show insider" do
    get :show, :id => insiders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => insiders(:one).to_param
    assert_response :success
  end

  test "should update insider" do
    put :update, :id => insiders(:one).to_param, :insider => { }
    assert_redirected_to insider_path(assigns(:insider))
  end

  test "should destroy insider" do
    assert_difference('Insider.count', -1) do
      delete :destroy, :id => insiders(:one).to_param
    end

    assert_redirected_to insiders_path
  end
end
