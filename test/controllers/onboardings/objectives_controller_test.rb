require "test_helper"

class Onboardings::ObjectivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onboardings_objective = onboardings_objectives(:one)
  end

  test "should get index" do
    get onboardings_objectives_url
    assert_response :success
  end

  test "should get new" do
    get new_onboardings_objective_url
    assert_response :success
  end

  test "should create onboardings_objective" do
    assert_difference("Onboardings::Objective.count") do
      post onboardings_objectives_url, params: { onboardings_objective: { description: @onboardings_objective.description, finished_message: @onboardings_objective.finished_message, name: @onboardings_objective.name } }
    end

    assert_redirected_to onboardings_objective_url(Onboardings::Objective.last)
  end

  test "should show onboardings_objective" do
    get onboardings_objective_url(@onboardings_objective)
    assert_response :success
  end

  test "should get edit" do
    get edit_onboardings_objective_url(@onboardings_objective)
    assert_response :success
  end

  test "should update onboardings_objective" do
    patch onboardings_objective_url(@onboardings_objective), params: { onboardings_objective: { description: @onboardings_objective.description, finished_message: @onboardings_objective.finished_message, name: @onboardings_objective.name } }
    assert_redirected_to onboardings_objective_url(@onboardings_objective)
  end

  test "should destroy onboardings_objective" do
    assert_difference("Onboardings::Objective.count", -1) do
      delete onboardings_objective_url(@onboardings_objective)
    end

    assert_redirected_to onboardings_objectives_url
  end
end
