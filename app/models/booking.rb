class Booking < ActiveRecord::Base
  attr_accessible :tour, :hotel, :person_name, :email, :phone, :number_of_adults, :number_of_children

  validates :tour, :hotel, :person_name, :email, :phone, :number_of_adults, :number_of_children, presence: true

  has_one :hotel
  has_one :tour
  belongs_to :user
end
