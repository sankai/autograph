require 'test_helper'

class AutographsControllerTest < ActionController::TestCase
  setup do
    @autograph = autographs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:autographs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create autograph" do
    assert_difference('Autograph.count') do
      post :create, autograph: { name: @autograph.name }
    end

    assert_redirected_to autograph_path(assigns(:autograph))
  end

  test "should show autograph" do
    get :show, id: @autograph
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @autograph
    assert_response :success
  end

  test "should update autograph" do
    patch :update, id: @autograph, autograph: { name: @autograph.name }
    assert_redirected_to autograph_path(assigns(:autograph))
  end

  test "should destroy autograph" do
    assert_difference('Autograph.count', -1) do
      delete :destroy, id: @autograph
    end

    assert_redirected_to autographs_path
  end
end
