require 'test_helper'

class CaracterRolPersonasControllerTest < ActionController::TestCase
  setup do
    @caracter_rol_persona = caracter_rol_personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caracter_rol_personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caracter_rol_persona" do
    assert_difference('CaracterRolPersona.count') do
      post :create, caracter_rol_persona: { caracteristica: @caracter_rol_persona.caracteristica, requerido: @caracter_rol_persona.requerido, rol_persona_id: @caracter_rol_persona.rol_persona_id, tipo_dato_id: @caracter_rol_persona.tipo_dato_id }
    end

    assert_redirected_to caracter_rol_persona_path(assigns(:caracter_rol_persona))
  end

  test "should show caracter_rol_persona" do
    get :show, id: @caracter_rol_persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caracter_rol_persona
    assert_response :success
  end

  test "should update caracter_rol_persona" do
    patch :update, id: @caracter_rol_persona, caracter_rol_persona: { caracteristica: @caracter_rol_persona.caracteristica, requerido: @caracter_rol_persona.requerido, rol_persona_id: @caracter_rol_persona.rol_persona_id, tipo_dato_id: @caracter_rol_persona.tipo_dato_id }
    assert_redirected_to caracter_rol_persona_path(assigns(:caracter_rol_persona))
  end

  test "should destroy caracter_rol_persona" do
    assert_difference('CaracterRolPersona.count', -1) do
      delete :destroy, id: @caracter_rol_persona
    end

    assert_redirected_to caracter_rol_personas_path
  end
end
