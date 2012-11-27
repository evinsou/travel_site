class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  has_many :hotels, through: :bookings, source: :bookingable, source_type: "Hotel"
  has_many :tours, through: :bookings, source: :bookingable, source_type: "Tour"
  has_many :bookings
  has_and_belongs_to_many :roles
end
