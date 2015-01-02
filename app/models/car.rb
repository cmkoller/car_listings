class Car < ActiveRecord::Base
  belongs_to :manufacturer
  validates_associated :manufacturer

  validates :color,
    presence: true,
    length: {maximum: 255}
  validates :year,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than: 1920 }
  validates :mileage,
    presence: true

  def name
    "#{year} #{color} #{manufacturer.name}"
  end

end
