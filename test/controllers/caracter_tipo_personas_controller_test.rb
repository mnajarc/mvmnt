require 'test_helper'

class CaracterTipoPersonasControllerTest < ActionController::TestCase
  setup do
    @caracter_tipo_persona = caracter_tipo_personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caracter_tipo_personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caracter_tipo_persona" do
    assert_difference('CaracterTipoPersona.count') do
      post :create, caracter_tipo_persona: { caracteristica: @caracter_tipo_persona.caracteristica, requerido: @caracter_tipo_persona.requerido, tipo_dato_id: @caracter_tipo_persona.tipo_dato_id, tipo_persona_id: @caracter_tipo_persona.tipo_persona_id }
    end

    assert_redirected_to caracter_tipo_persona_path(assigns(:caracter_tipo_persona))
  end

  test "should show caracter_tipo_persona" do
    get :show, id: @caracter_tipo_persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caracter_tipo_persona
    assert_response :success
  end

  test "should update caracter_tipo_persona" do
    patch :update, id: @caracter_tipo_persona, caracter_tipo_persona: { caracteristica: @caracter_tipo_persona.caracteristica, requerido: @caracter_tipo_persona.requerido, tipo_dato_id: @caracter_tipo_persona.tipo_dato_id, tipo_persona_id: @caracter_tipo_persona.tipo_persona_id }
    assert_redirected_to caracter_tipo_persona_path(assigns(:caracter_tipo_persona))
  end

  test "should destroy caracter_tipo_persona" do
    assert_difference('CaracterTipoPersona.count', -1) do
      delete :destroy, id: @caracter_tipo_persona
    end

    assert_redirected_to caracter_tipo_personas_path
  end
end
