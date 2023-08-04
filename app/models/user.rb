class User
  USER_TYPES = %w[
    user
    admin
    visitor
  ].freeze

  def initialize(user_type:)
    raise WrongUserTypeError unless user_type.in?(USER_TYPES)

    @user_type = user_type
  end

  def name
    if admin?
      'MyAdmin'
    else
      'MyUser'
    end
  end

  def admin?
    @user_type == 'admin'
  end

  def user?
    @user_type == 'user'
  end

  def connected?
    @user_type != 'visitor'
  end

  def visitor?
    @user_type == 'visitor'
  end

  class WrongUserTypeError < StandardError; end
end
