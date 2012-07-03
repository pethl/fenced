require 'test_helper'

class DilemmasControllerTest < ActionController::TestCase
  setup do
    @dilemma = dilemmas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dilemmas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dilemma" do
    assert_difference('Dilemma.count') do
      post :create, dilemma: { ans_opt: @dilemma.ans_opt, dilemma: @dilemma.dilemma, id: @dilemma.id, status: @dilemma.status, title: @dilemma.title }
    end

    assert_redirected_to dilemma_path(assigns(:dilemma))
  end

  test "should show dilemma" do
    get :show, id: @dilemma
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dilemma
    assert_response :success
  end

  test "should update dilemma" do
    put :update, id: @dilemma, dilemma: { ans_opt: @dilemma.ans_opt, dilemma: @dilemma.dilemma, id: @dilemma.id, status: @dilemma.status, title: @dilemma.title }
    assert_redirected_to dilemma_path(assigns(:dilemma))
  end

  test "should destroy dilemma" do
    assert_difference('Dilemma.count', -1) do
      delete :destroy, id: @dilemma
    end

    assert_redirected_to dilemmas_path
  end
end
