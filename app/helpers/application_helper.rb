module ApplicationHelper
  def is_admin? user
    return unless user.is_a? User
    names = []
    names = user.roles.collect { |x| x.name }
    names.include? 'admin' ? true : false
  end
end
