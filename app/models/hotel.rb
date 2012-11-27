class Hotel < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :city

  validates :title, :rating, :description, :city, presence: true

  has_many :bookings, as: :bookingable
  has_many :users, through: :bookings

  def days_between #or nights
    #self.return_date - self.departure_date
    return_date - departure_date
  end
end
