class Tour < ActiveRecord::Base
  attr_accessible :name, :description, :departure_date, :return_date, :from_city, :to_city, :price

  validates :name, :description, :departure_date, :return_date, :from_city, :to_city, :price, presence: true

  has_many :bookings, as: :bookingable
  has_many :users, through: :bookings
  #scope :hot_tours, where((:departure_date.to_date - Time.now.to_date) < 2.weeks)
  #scope :cheaper_than, lambda { |price| where("price < ?", price) }
  #scope :free_places_less_than, lambda { |price| where("price < ?", price) } where free_places < 5
end