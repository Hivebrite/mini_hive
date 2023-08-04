module SessionsHelper
  def current_user
    user_data = session[:user]
    if @_current_user
      @_current_user
    elsif user_data.present?
      @_current_user = User.new(**user_data.symbolize_keys)
    else
      @_current_user = User.new(user_type: 'visitor')
    end
  end

  def set_current_user(user_type)
    user = User.new(user_type:)
    session[:user] = user.as_json
    @_current_user = user
  end
end
