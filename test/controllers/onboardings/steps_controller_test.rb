require "test_helper"

class Onboardings::StepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onboardings_step = onboardings_steps(:one)
  end

  test "should get index" do
    get onboardings_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_onboardings_step_url
    assert_response :success
  end

  test "should create onboardings_step" do
    assert_difference("Onboardings::Step.count") do
      post onboardings_steps_url, params: { onboardings_step: { list_id: @onboardings_step.list_id, resource_id: @onboardings_step.resource_id, resource_type: @onboardings_step.resource_type } }
    end

    assert_redirected_to onboardings_step_url(Onboardings::Step.last)
  end

  test "should show onboardings_step" do
    get onboardings_step_url(@onboardings_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_onboardings_step_url(@onboardings_step)
    assert_response :success
  end

  test "should update onboardings_step" do
    patch onboardings_step_url(@onboardings_step), params: { onboardings_step: { list_id: @onboardings_step.list_id, resource_id: @onboardings_step.resource_id, resource_type: @onboardings_step.resource_type } }
    assert_redirected_to onboardings_step_url(@onboardings_step)
  end

  test "should destroy onboardings_step" do
    assert_difference("Onboardings::Step.count", -1) do
      delete onboardings_step_url(@onboardings_step)
    end

    assert_redirected_to onboardings_steps_url
  end
end
