FactoryGirl.define do
  factory :manufacturer do
    name "Ford"
    country "USA"
  end

  factory :car do
    manufacturer
    color "Blue"
    year "1999"
    mileage "10000"
    description "This is a really beat-up old car!"
  end
end
