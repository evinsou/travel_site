class Hotel < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :city

  validates :title, :rating, :description, :city, presence: true

  def days_between
    self.return_date - self.departure_date
  end
end
