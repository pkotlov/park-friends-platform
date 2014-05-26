require 'test_helper'

class FacebookRegistrationsControllerTest < ActionController::TestCase
  setup do
    @facebook_registration = facebook_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facebook_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facebook_registration" do
    assert_difference('FacebookRegistration.count') do
      post :create, facebook_registration: { email: @facebook_registration.email, facebook: @facebook_registration.facebook, facebookId: @facebook_registration.facebookId, name: @facebook_registration.name }
    end

    assert_redirected_to facebook_registration_path(assigns(:facebook_registration))
  end

  test "should show facebook_registration" do
    get :show, id: @facebook_registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facebook_registration
    assert_response :success
  end

  test "should update facebook_registration" do
    patch :update, id: @facebook_registration, facebook_registration: { email: @facebook_registration.email, facebook: @facebook_registration.facebook, facebookId: @facebook_registration.facebookId, name: @facebook_registration.name }
    assert_redirected_to facebook_registration_path(assigns(:facebook_registration))
  end

  test "should destroy facebook_registration" do
    assert_difference('FacebookRegistration.count', -1) do
      delete :destroy, id: @facebook_registration
    end

    assert_redirected_to facebook_registrations_path
  end
end
