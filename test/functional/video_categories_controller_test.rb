require 'test_helper'

class VideoCategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:video_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video_category" do
    assert_difference('VideoCategory.count') do
      post :create, :video_category => { }
    end

    assert_redirected_to video_category_path(assigns(:video_category))
  end

  test "should show video_category" do
    get :show, :id => video_categories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => video_categories(:one).to_param
    assert_response :success
  end

  test "should update video_category" do
    put :update, :id => video_categories(:one).to_param, :video_category => { }
    assert_redirected_to video_category_path(assigns(:video_category))
  end

  test "should destroy video_category" do
    assert_difference('VideoCategory.count', -1) do
      delete :destroy, :id => video_categories(:one).to_param
    end

    assert_redirected_to video_categories_path
  end
end
