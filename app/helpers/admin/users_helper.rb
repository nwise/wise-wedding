module Admin::UsersHelper

  def active_state_for(user)
    user.is_admin? ? 'active' : ''
  end
end
