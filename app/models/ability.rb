class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Article]
    if user.is? :admin
      can :manage, :all
    end
  end
end
