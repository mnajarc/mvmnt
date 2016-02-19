require 'test_helper'

class NacionsControllerTest < ActionController::TestCase
  setup do
    @nacion = nacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nacion" do
    assert_difference('Nacion.count') do
      post :create, nacion: { nombre: @nacion.nombre }
    end

    assert_redirected_to nacion_path(assigns(:nacion))
  end

  test "should show nacion" do
    get :show, id: @nacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nacion
    assert_response :success
  end

  test "should update nacion" do
    patch :update, id: @nacion, nacion: { nombre: @nacion.nombre }
    assert_redirected_to nacion_path(assigns(:nacion))
  end

  test "should destroy nacion" do
    assert_difference('Nacion.count', -1) do
      delete :destroy, id: @nacion
    end

    assert_redirected_to nacions_path
  end
end
