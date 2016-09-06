require 'test_helper'

class ProgresControllerTest < ActionController::TestCase
  setup do
    @progre = progres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:progres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create progre" do
    assert_difference('Progre.count') do
      post :create, progre: {  }
    end

    assert_redirected_to progre_path(assigns(:progre))
  end

  test "should show progre" do
    get :show, id: @progre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @progre
    assert_response :success
  end

  test "should update progre" do
    patch :update, id: @progre, progre: {  }
    assert_redirected_to progre_path(assigns(:progre))
  end

  test "should destroy progre" do
    assert_difference('Progre.count', -1) do
      delete :destroy, id: @progre
    end

    assert_redirected_to progres_path
  end
end
