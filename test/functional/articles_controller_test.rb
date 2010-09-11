require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get unauth when creating without login" do
    assert_raise CanCan::AccessDenied do
      get :new
    end
  end

  test "should get unauth when editing without login" do
    assert_raise CanCan::AccessDenied do
      get :edit, :id => articles(:one).to_param
    end
  end

  #test "should update article" do
    #put :update, :id => articles(:one).to_param, :article => { }
    #assert_redirected_to article_path(assigns(:article))
  #end
end
