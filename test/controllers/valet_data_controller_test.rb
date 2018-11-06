require 'test_helper'

class ValetDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valet_datum = valet_data(:one)
  end

  test "should get index" do
    get valet_data_url
    assert_response :success
  end

  test "should get new" do
    get new_valet_datum_url
    assert_response :success
  end

  test "should create valet_datum" do
    assert_difference('ValetDatum.count') do
      post valet_data_url, params: { valet_datum: { accepted: @valet_datum.accepted, completed: @valet_datum.completed, assigned: @valet_datum.assigned, description: @valet_datum.description, requested: @valet_datum.requested, ticket: @valet_datum.ticket } }
    end

    assert_redirected_to valet_datum_url(ValetDatum.last)
  end

  test "should show valet_datum" do
    get valet_datum_url(@valet_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_valet_datum_url(@valet_datum)
    assert_response :success
  end

  test "should update valet_datum" do
    patch valet_datum_url(@valet_datum), params: { valet_datum: { accepted: @valet_datum.accepted, completed: @valet_datum.completed, assigned: @valet_datum.assigned, description: @valet_datum.description, requested: @valet_datum.requested, ticket: @valet_datum.ticket } }
    assert_redirected_to valet_datum_url(@valet_datum)
  end

  test "should destroy valet_datum" do
    assert_difference('ValetDatum.count', -1) do
      delete valet_datum_url(@valet_datum)
    end

    assert_redirected_to valet_data_url
  end
end
