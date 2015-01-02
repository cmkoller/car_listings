class Manufacturer < ActiveRecord::Base
  has_many :cars

  validates :name,
    presence: true,
    length: {maximum: 255}
  validates :country,
    presence: true,
    length: {maximum: 255}
end
