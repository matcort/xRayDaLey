require 'test_helper'

class InfoleysControllerTest < ActionController::TestCase
  setup do
    @infoley = infoleys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:infoleys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create infoley" do
    assert_difference('Infoley.count') do
      post :create, infoley: { cont_ley: @infoley.cont_ley, exp_simpl: @infoley.exp_simpl, fecha: @infoley.fecha, numero_ley: @infoley.numero_ley, proy_ley: @infoley.proy_ley, tipo: @infoley.tipo }
    end

    assert_redirected_to infoley_path(assigns(:infoley))
  end

  test "should show infoley" do
    get :show, id: @infoley
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @infoley
    assert_response :success
  end

  test "should update infoley" do
    patch :update, id: @infoley, infoley: { cont_ley: @infoley.cont_ley, exp_simpl: @infoley.exp_simpl, fecha: @infoley.fecha, numero_ley: @infoley.numero_ley, proy_ley: @infoley.proy_ley, tipo: @infoley.tipo }
    assert_redirected_to infoley_path(assigns(:infoley))
  end

  test "should destroy infoley" do
    assert_difference('Infoley.count', -1) do
      delete :destroy, id: @infoley
    end

    assert_redirected_to infoleys_path
  end
end
