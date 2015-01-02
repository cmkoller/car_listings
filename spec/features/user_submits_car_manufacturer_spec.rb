require 'rails_helper'
feature "Add New Manufacturer", %q(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
) do

  manufacturer_name = "Awesome Manufacturer"
  manufacturer_country = "Germany"

  scenario "user successfully adds manufacturer" do
    visit new_manufacturer_path
    fill_in "Name", with: manufacturer_name
    fill_in "Country", with: manufacturer_country
    click_button "Submit"
    expect(page).to have_content("Manufacturer successfully added")
    expect(page).to have_content ("Manufacturers")
    expect(page).to have_content(manufacturer_name)
  end

  scenario "user unsuccessfully adds manufacturer" do
    visit new_manufacturer_path
    fill_in "Name", with: manufacturer_name
    click_button "Submit"
    expect(page).to have_content("Country can't be blank")
    expect(page).to have_content ("Add New Manufacturer")
    expect(find_field("Name").value).to eq manufacturer_name
  end
end
