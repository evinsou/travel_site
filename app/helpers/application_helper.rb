module ApplicationHelper
  def is_admin? user
    return unless user.is_a? User
    names = []
    names = user.roles.collect { |x| x.name }
    names.include? 'admin' ? true : false
  end
  def back_to params
    if params[:tour_id]
      link_to 'back to tours', tours_path
    elsif params[:hotel_id]
      link_to 'back to hotels', hotels_path
    end
  end
end
