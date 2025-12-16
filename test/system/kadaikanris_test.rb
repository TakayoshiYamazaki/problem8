require "application_system_test_case"

class KadaikanrisTest < ApplicationSystemTestCase
  setup do
    @kadaikanri = kadaikanris(:one)
  end

  test "visiting the index" do
    visit kadaikanris_url
    assert_selector "h1", text: "Kadaikanris"
  end

  test "should create kadaikanri" do
    visit kadaikanris_url
    click_on "New kadaikanri"

    fill_in "Content", with: @kadaikanri.content
    fill_in "Entrydate", with: @kadaikanri.entrydate
    fill_in "Location", with: @kadaikanri.location
    fill_in "No", with: @kadaikanri.no
    fill_in "Plan", with: @kadaikanri.plan
    fill_in "Reporter", with: @kadaikanri.reporter
    fill_in "Status", with: @kadaikanri.status_id
    click_on "Create Kadaikanri"

    assert_text "Kadaikanri was successfully created"
    click_on "Back"
  end

  test "should update Kadaikanri" do
    visit kadaikanri_url(@kadaikanri)
    click_on "Edit this kadaikanri", match: :first

    fill_in "Content", with: @kadaikanri.content
    fill_in "Entrydate", with: @kadaikanri.entrydate
    fill_in "Location", with: @kadaikanri.location
    fill_in "No", with: @kadaikanri.no
    fill_in "Plan", with: @kadaikanri.plan
    fill_in "Reporter", with: @kadaikanri.reporter
    fill_in "Status", with: @kadaikanri.status_id
    click_on "Update Kadaikanri"

    assert_text "Kadaikanri was successfully updated"
    click_on "Back"
  end

  test "should destroy Kadaikanri" do
    visit kadaikanri_url(@kadaikanri)
    accept_confirm { click_on "Destroy this kadaikanri", match: :first }

    assert_text "Kadaikanri was successfully destroyed"
  end
end
