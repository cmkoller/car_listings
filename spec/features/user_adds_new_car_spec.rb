require 'rails_helper'
feature "Add New Car", %q(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
) do

  let(:manufacturer) { FactoryGirl.create(:manufacturer) }

  before(:each) do
    manufacturer.save
    visit new_car_path
  end

  scenario "user successfully adds car" do
    select manufacturer.name, from: "Manufacturer"
    fill_in "Color", with: "Blue"
    fill_in "Year", with: "2002"
    fill_in "Mileage", with: "33333"
    fill_in "Description", with: "This is a pretty cool car."
    click_button "Submit"
    expect(page).to have_content("Car successfully created")
    expect(page).to have_content("Cars")
    expect(page).to have_content("2002 Blue Ford")
  end

  scenario "user unsuccessfully adds car" do
    select manufacturer.name, from: "Manufacturer"
    fill_in "Color", with: "Blue"
    fill_in "Year", with: "1800"
    fill_in "Mileage", with: "33333"
    fill_in "Description", with: "This is a pretty cool car."
    click_button "Submit"
    expect(page).to have_content("Year must be greater than 1920")
    expect(page).to have_content("Add New Car")
    expect(find_field("Color").value).to eq "Blue"
  end

end
