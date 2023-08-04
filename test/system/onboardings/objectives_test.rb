require "application_system_test_case"

class Onboardings::ObjectivesTest < ApplicationSystemTestCase
  setup do
    @onboardings_objective = onboardings_objectives(:one)
  end

  test "visiting the index" do
    visit onboardings_objectives_url
    assert_selector "h1", text: "Objectives"
  end

  test "should create objective" do
    visit onboardings_objectives_url
    click_on "New objective"

    fill_in "Description", with: @onboardings_objective.description
    fill_in "Finished message", with: @onboardings_objective.finished_message
    fill_in "Name", with: @onboardings_objective.name
    click_on "Create Objective"

    assert_text "Objective was successfully created"
    click_on "Back"
  end

  test "should update Objective" do
    visit onboardings_objective_url(@onboardings_objective)
    click_on "Edit this objective", match: :first

    fill_in "Description", with: @onboardings_objective.description
    fill_in "Finished message", with: @onboardings_objective.finished_message
    fill_in "Name", with: @onboardings_objective.name
    click_on "Update Objective"

    assert_text "Objective was successfully updated"
    click_on "Back"
  end

  test "should destroy Objective" do
    visit onboardings_objective_url(@onboardings_objective)
    click_on "Destroy this objective", match: :first

    assert_text "Objective was successfully destroyed"
  end
end
