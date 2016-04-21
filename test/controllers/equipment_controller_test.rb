require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  setup do
    @equipment = equipment(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment" do
    assert_difference('Equipment.count') do
      post :create, equipment: { internal_number: @equipment.internal_number, license_plate_number: @equipment.license_plate_number, vehicle_type: @equipment.vehicle_type, vin: @equipment.vin }
    end

    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should show equipment" do
    get :show, id: @equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipment
    assert_response :success
  end

  test "should update equipment" do
    patch :update, id: @equipment, equipment: { internal_number: @equipment.internal_number, license_plate_number: @equipment.license_plate_number, vehicle_type: @equipment.vehicle_type, vin: @equipment.vin }
    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should destroy equipment" do
    assert_difference('Equipment.count', -1) do
      delete :destroy, id: @equipment
    end

    assert_redirected_to equipment_index_path
  end
end
