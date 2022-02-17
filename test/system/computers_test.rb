require "application_system_test_case"

class ComputersTest < ApplicationSystemTestCase
  setup do
    @computer = computers(:one)
  end

  test "visiting the index" do
    visit computers_url
    assert_selector "h1", text: "Computers"
  end

  test "should create computer" do
    visit computers_url
    click_on "New computer"

    fill_in "Apps score", with: @computer.apps_score
    fill_in "Cpu", with: @computer.cpu
    fill_in "Details url", with: @computer.details_url
    fill_in "Discrete gpu", with: @computer.discrete_gpu
    fill_in "Gaming score", with: @computer.gaming_score
    fill_in "Integrated gpu", with: @computer.integrated_gpu
    fill_in "Movility score", with: @computer.movility_score
    fill_in "Name", with: @computer.name
    fill_in "Price", with: @computer.price
    fill_in "Ram", with: @computer.ram
    fill_in "Screen", with: @computer.screen
    fill_in "Storage", with: @computer.storage
    click_on "Create Computer"

    assert_text "Computer was successfully created"
    click_on "Back"
  end

  test "should update Computer" do
    visit computer_url(@computer)
    click_on "Edit this computer", match: :first

    fill_in "Apps score", with: @computer.apps_score
    fill_in "Cpu", with: @computer.cpu
    fill_in "Details url", with: @computer.details_url
    fill_in "Discrete gpu", with: @computer.discrete_gpu
    fill_in "Gaming score", with: @computer.gaming_score
    fill_in "Integrated gpu", with: @computer.integrated_gpu
    fill_in "Movility score", with: @computer.movility_score
    fill_in "Name", with: @computer.name
    fill_in "Price", with: @computer.price
    fill_in "Ram", with: @computer.ram
    fill_in "Screen", with: @computer.screen
    fill_in "Storage", with: @computer.storage
    click_on "Update Computer"

    assert_text "Computer was successfully updated"
    click_on "Back"
  end

  test "should destroy Computer" do
    visit computer_url(@computer)
    click_on "Destroy this computer", match: :first

    assert_text "Computer was successfully destroyed"
  end
end
