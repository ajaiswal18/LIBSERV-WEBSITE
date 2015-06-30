require 'test_helper'

class OnlinetestsControllerTest < ActionController::TestCase
  setup do
    @onlinetest = onlinetests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:onlinetests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create onlinetest" do
    assert_difference('Onlinetest.count') do
      post :create, onlinetest: { answer_given: @onlinetest.answer_given }
    end

    assert_redirected_to onlinetest_path(assigns(:onlinetest))
  end

  test "should show onlinetest" do
    get :show, id: @onlinetest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @onlinetest
    assert_response :success
  end

  test "should update onlinetest" do
    patch :update, id: @onlinetest, onlinetest: { answer_given: @onlinetest.answer_given }
    assert_redirected_to onlinetest_path(assigns(:onlinetest))
  end

  test "should destroy onlinetest" do
    assert_difference('Onlinetest.count', -1) do
      delete :destroy, id: @onlinetest
    end

    assert_redirected_to onlinetests_path
  end
end
