require 'test_helper'

class ErrquestsControllerTest < ActionController::TestCase
  setup do
    @errquest = errquests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:errquests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create errquest" do
    assert_difference('Errquest.count') do
      post :create, errquest: { amount: @errquest.amount }
    end

    assert_redirected_to errquest_path(assigns(:errquest))
  end

  test "should show errquest" do
    get :show, id: @errquest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @errquest
    assert_response :success
  end

  test "should update errquest" do
    patch :update, id: @errquest, errquest: { amount: @errquest.amount }
    assert_redirected_to errquest_path(assigns(:errquest))
  end

  test "should destroy errquest" do
    assert_difference('Errquest.count', -1) do
      delete :destroy, id: @errquest
    end

    assert_redirected_to errquests_path
  end
end
