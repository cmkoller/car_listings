require 'rails_helper'
feature "View Manufacturer", %q(
  As a car salesperson
  I want to view the details of a manufacturer
  So I can remember where a car was made
) do

  let(:manufacturer) { FactoryGirl.create(:manufacturer) }
  let(:car) { FactoryGirl.create(:car) }

  scenario "user views manufacturer details" do
    car.manufacturer_id = manufacturer.id
    car.save
    visit manufacturer_path(manufacturer)
    expect(page).to have_content(manufacturer.name)
    expect(page).to have_content(manufacturer.country)
    expect(page).to have_link("#{car.year} #{car.color} #{car.manufacturer.name}")
  end

end
