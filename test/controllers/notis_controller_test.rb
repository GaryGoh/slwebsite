require 'test_helper'

class NotisControllerTest < ActionController::TestCase
  setup do
    @noti = notis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create noti" do
    assert_difference('Noti.count') do
      post :create, noti: { category_id: @noti.category_id, content: @noti.content, end_time: @noti.end_time, society_id: @noti.society_id, start_time: @noti.start_time, title: @noti.title, user_id: @noti.user_id }
    end

    assert_redirected_to noti_path(assigns(:noti))
  end

  test "should show noti" do
    get :show, id: @noti
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @noti
    assert_response :success
  end

  test "should update noti" do
    patch :update, id: @noti, noti: { category_id: @noti.category_id, content: @noti.content, end_time: @noti.end_time, society_id: @noti.society_id, start_time: @noti.start_time, title: @noti.title, user_id: @noti.user_id }
    assert_redirected_to noti_path(assigns(:noti))
  end

  test "should destroy noti" do
    assert_difference('Noti.count', -1) do
      delete :destroy, id: @noti
    end

    assert_redirected_to notis_path
  end
end
