class Ability
  include CanCan::Ability

  def initialize(user)
    can %i[new create], User
    can %i[new create], :session

    return unless user.present?

    can :manage, :all, user:
  end
end
