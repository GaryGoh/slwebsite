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
<<<<<<< HEAD
      post :create, user: { admin: @user.admin, contact: @user.contact, department: @user.department, email: @user.email, gender: @user.gender, name: @user.name, password_digest: @user.password_digest, proverb: @user.proverb, stuid: @user.stuid }
=======
      post :create, user: { contact: @user.contact, department: @user.department, gender: @user.gender, name: @user.name, proverb: @user.proverb, provider: @user.provider, uid: @user.uid, username: @user.username }
>>>>>>> 5ca2571934df2e2f1f78f1ccbea7d6db10dbbed3
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
<<<<<<< HEAD
    patch :update, id: @user, user: { admin: @user.admin, contact: @user.contact, department: @user.department, email: @user.email, gender: @user.gender, name: @user.name, password_digest: @user.password_digest, proverb: @user.proverb, stuid: @user.stuid }
=======
    patch :update, id: @user, user: { contact: @user.contact, department: @user.department, gender: @user.gender, name: @user.name, proverb: @user.proverb, provider: @user.provider, uid: @user.uid, username: @user.username }
>>>>>>> 5ca2571934df2e2f1f78f1ccbea7d6db10dbbed3
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
