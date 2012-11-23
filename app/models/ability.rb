class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    elsif user.role? :manager
      can :manage, [Tour, Hotel]
    else
      can :read, [Tour, Hotel]
      can :create Booking
    end
  end
end
