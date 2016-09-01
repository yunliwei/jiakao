require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { Subject: @user.Subject, age: @user.age, head: @user.head, idcard: @user.idcard, login: @user.login, loginnumber: @user.loginnumber, logintime: @user.logintime, logintype: @user.logintype, model: @user.model, money: @user.money, name: @user.name, password: @user.password, sex: @user.sex, status: @user.status, studentid: @user.studentid }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { Subject: @user.Subject, age: @user.age, head: @user.head, idcard: @user.idcard, login: @user.login, loginnumber: @user.loginnumber, logintime: @user.logintime, logintype: @user.logintype, model: @user.model, money: @user.money, name: @user.name, password: @user.password, sex: @user.sex, status: @user.status, studentid: @user.studentid }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
