require 'test_helper'

class JobpostingsControllerTest < ActionController::TestCase
  setup do
    @jobposting = jobpostings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobpostings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jobposting" do
    assert_difference('Jobposting.count') do
      post :create, jobposting: {  }
    end

    assert_redirected_to jobposting_path(assigns(:jobposting))
  end

  test "should show jobposting" do
    get :show, id: @jobposting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jobposting
    assert_response :success
  end

  test "should update jobposting" do
    patch :update, id: @jobposting, jobposting: {  }
    assert_redirected_to jobposting_path(assigns(:jobposting))
  end

  test "should destroy jobposting" do
    assert_difference('Jobposting.count', -1) do
      delete :destroy, id: @jobposting
    end

    assert_redirected_to jobpostings_path
  end
end
