class Tour < ActiveRecord::Base
  attr_accessible :name, :description, :departure_date, :return_date, :from_city, :to_city, :price

  validates :name, :description, :departure_date, :return_date, :from_city, :to_city, :price, presence: true
end
