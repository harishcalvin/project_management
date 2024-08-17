require "application_system_test_case"

class PhasesTest < ApplicationSystemTestCase
  setup do
    @phase = phases(:one)
  end

  test "visiting the index" do
    visit phases_url
    assert_selector "h1", text: "Phases"
  end

  test "should create phase" do
    visit phases_url
    click_on "New phase"

    fill_in "Description", with: @phase.description
    fill_in "End end", with: @phase.end_end
    fill_in "Project", with: @phase.project_id
    fill_in "Start date", with: @phase.start_date
    fill_in "Status", with: @phase.status
    fill_in "Title", with: @phase.title
    click_on "Create Phase"

    assert_text "Phase was successfully created"
    click_on "Back"
  end

  test "should update Phase" do
    visit phase_url(@phase)
    click_on "Edit this phase", match: :first

    fill_in "Description", with: @phase.description
    fill_in "End end", with: @phase.end_end
    fill_in "Project", with: @phase.project_id
    fill_in "Start date", with: @phase.start_date
    fill_in "Status", with: @phase.status
    fill_in "Title", with: @phase.title
    click_on "Update Phase"

    assert_text "Phase was successfully updated"
    click_on "Back"
  end

  test "should destroy Phase" do
    visit phase_url(@phase)
    click_on "Destroy this phase", match: :first

    assert_text "Phase was successfully destroyed"
  end
end
