require 'test_helper'

class OkPlayersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ok_players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ok_player" do
    assert_difference('OkPlayer.count') do
      post :create, :ok_player => { }
    end

    assert_redirected_to ok_player_path(assigns(:ok_player))
  end

  test "should show ok_player" do
    get :show, :id => ok_players(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ok_players(:one).to_param
    assert_response :success
  end

  test "should update ok_player" do
    put :update, :id => ok_players(:one).to_param, :ok_player => { }
    assert_redirected_to ok_player_path(assigns(:ok_player))
  end

  test "should destroy ok_player" do
    assert_difference('OkPlayer.count', -1) do
      delete :destroy, :id => ok_players(:one).to_param
    end

    assert_redirected_to ok_players_path
  end
end
