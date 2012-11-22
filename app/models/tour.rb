class Tour < ActiveRecord::Base
  attr_accessible :name, :description, :departure_date, :return_date, :from_city, :to_city, :price

  validates :name, :description, :departure_date, :return_date, :from_city, :to_city, :price, presence: true

  has_many :comments, as: :commentable
  has_many :bookings, as: :bookingable
  belongs_to :user
  #scope :hot_tours, where((:departure_date.to_date - Time.now.to_date) < 2.weeks)
  #scope :cheaper_than, lambda { |price| where("price < ?", price) }
  #scope :free_places_less_than, lambda { |price| where("price < ?", price) } where free_places < 5
end
=begin
tour has_many users through bookings
hotel has_many users through bookings
user has_many bookings
user has_many hotels through bookings
user has_many tours through bookings

class Authorship < ActiveRecord::Base #booking user_id polymorphic true
  belongs_to :author # user
  belongs_to :publication, bookingable :polymorphic => true
end

class Author < ActiveRecord::Base #user is not yet exist
  has_many :authorships
  has_many :books, :through => :authorships, bookings :source => :publication, bookingable :source_type => "Book" #Tour
  has_many :articles, :through => :authorships, bookings :source => :publication, bookingable :source_type => "Article" # Hotel
end

class Book < ActiveRecord::Base #tour
  has_many :authorships, :as => :publication bookings as bookingable
  has_many :authors, :through => :authorships bookings
end

class Article < ActiveRecord::Base #hotel
  has_many :authorships, :as => :publication bookings as bookingable
  has_many :authors, :through => :authorships bookings
end
=end