require 'test_helper'

class TipoDatosControllerTest < ActionController::TestCase
  setup do
    @tipo_dato = tipo_datos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_datos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_dato" do
    assert_difference('TipoDato.count') do
      post :create, tipo_dato: { dataprot: @tipo_dato.dataprot, tipo_dato: @tipo_dato.tipo_dato }
    end

    assert_redirected_to tipo_dato_path(assigns(:tipo_dato))
  end

  test "should show tipo_dato" do
    get :show, id: @tipo_dato
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_dato
    assert_response :success
  end

  test "should update tipo_dato" do
    patch :update, id: @tipo_dato, tipo_dato: { dataprot: @tipo_dato.dataprot, tipo_dato: @tipo_dato.tipo_dato }
    assert_redirected_to tipo_dato_path(assigns(:tipo_dato))
  end

  test "should destroy tipo_dato" do
    assert_difference('TipoDato.count', -1) do
      delete :destroy, id: @tipo_dato
    end

    assert_redirected_to tipo_datos_path
  end
end
