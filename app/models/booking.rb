class Booking < ActiveRecord::Base
  #attr_accessible :tour, :hotel, :person_name, :email, :phone, :number_of_adults, :number_of_children
  attr_accessible :id, :bookingable_id, :bookingable_type, :user_id
  #validates :tour, :hotel, :person_name, :email, :phone, :number_of_adults, :number_of_children, presence: true

  belongs_to :user
  belongs_to :bookingable, polymorphic: true
end
