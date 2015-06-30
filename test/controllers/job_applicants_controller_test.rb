require 'test_helper'

class JobApplicantsControllerTest < ActionController::TestCase
  setup do
    @job_applicant = job_applicants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_applicants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_applicant" do
    assert_difference('JobApplicant.count') do
      post :create, job_applicant: { applying_for: @job_applicant.applying_for, attachment: @job_applicant.attachment, contact_no: @job_applicant.contact_no, emailid: @job_applicant.emailid, name: @job_applicant.name }
    end

    assert_redirected_to job_applicant_path(assigns(:job_applicant))
  end

  test "should show job_applicant" do
    get :show, id: @job_applicant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_applicant
    assert_response :success
  end

  test "should update job_applicant" do
    patch :update, id: @job_applicant, job_applicant: { applying_for: @job_applicant.applying_for, attachment: @job_applicant.attachment, contact_no: @job_applicant.contact_no, emailid: @job_applicant.emailid, name: @job_applicant.name }
    assert_redirected_to job_applicant_path(assigns(:job_applicant))
  end

  test "should destroy job_applicant" do
    assert_difference('JobApplicant.count', -1) do
      delete :destroy, id: @job_applicant
    end

    assert_redirected_to job_applicants_path
  end
end
