require 'rails_helper'
feature "View Car", %q(
  As a car salesperson
  I want to view the details of a car in my lot
  So I can remember what information to tell an interested buyer
) do

  let(:car) { FactoryGirl.create(:car) }

  scenario "user views car details" do
    visit car_path(car)
    expect(page).to have_content(car.year)
    expect(page).to have_content(car.color)
    expect(page).to have_content(car.mileage)
    expect(page).to have_link(car.manufacturer.name)

  end

end
