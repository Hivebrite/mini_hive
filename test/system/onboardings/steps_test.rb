require "application_system_test_case"

class Onboardings::StepsTest < ApplicationSystemTestCase
  setup do
    @onboardings_step = onboardings_steps(:one)
  end

  test "visiting the index" do
    visit onboardings_steps_url
    assert_selector "h1", text: "Steps"
  end

  test "should create step" do
    visit onboardings_steps_url
    click_on "New step"

    fill_in "List", with: @onboardings_step.list_id
    fill_in "Resource", with: @onboardings_step.resource_id
    fill_in "Resource type", with: @onboardings_step.resource_type
    click_on "Create Step"

    assert_text "Step was successfully created"
    click_on "Back"
  end

  test "should update Step" do
    visit onboardings_step_url(@onboardings_step)
    click_on "Edit this step", match: :first

    fill_in "List", with: @onboardings_step.list_id
    fill_in "Resource", with: @onboardings_step.resource_id
    fill_in "Resource type", with: @onboardings_step.resource_type
    click_on "Update Step"

    assert_text "Step was successfully updated"
    click_on "Back"
  end

  test "should destroy Step" do
    visit onboardings_step_url(@onboardings_step)
    click_on "Destroy this step", match: :first

    assert_text "Step was successfully destroyed"
  end
end
