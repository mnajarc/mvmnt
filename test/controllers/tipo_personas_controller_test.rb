require 'test_helper'

class TipoPersonasControllerTest < ActionController::TestCase
  setup do
    @tipo_persona = tipo_personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_persona" do
    assert_difference('TipoPersona.count') do
      post :create, tipo_persona: { tipo_persona: @tipo_persona.tipo_persona }
    end

    assert_redirected_to tipo_persona_path(assigns(:tipo_persona))
  end

  test "should show tipo_persona" do
    get :show, id: @tipo_persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_persona
    assert_response :success
  end

  test "should update tipo_persona" do
    patch :update, id: @tipo_persona, tipo_persona: { tipo_persona: @tipo_persona.tipo_persona }
    assert_redirected_to tipo_persona_path(assigns(:tipo_persona))
  end

  test "should destroy tipo_persona" do
    assert_difference('TipoPersona.count', -1) do
      delete :destroy, id: @tipo_persona
    end

    assert_redirected_to tipo_personas_path
  end
end
