require 'test_helper'

class RolPersonasControllerTest < ActionController::TestCase
  setup do
    @rol_persona = rol_personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rol_personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rol_persona" do
    assert_difference('RolPersona.count') do
      post :create, rol_persona: { rol_persona: @rol_persona.rol_persona }
    end

    assert_redirected_to rol_persona_path(assigns(:rol_persona))
  end

  test "should show rol_persona" do
    get :show, id: @rol_persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rol_persona
    assert_response :success
  end

  test "should update rol_persona" do
    patch :update, id: @rol_persona, rol_persona: { rol_persona: @rol_persona.rol_persona }
    assert_redirected_to rol_persona_path(assigns(:rol_persona))
  end

  test "should destroy rol_persona" do
    assert_difference('RolPersona.count', -1) do
      delete :destroy, id: @rol_persona
    end

    assert_redirected_to rol_personas_path
  end
end
