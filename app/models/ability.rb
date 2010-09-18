class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Article, Match, Blog, Album, Player]
    can :show, User

    can :update, User do |u|
      u && u.id == user.id
    end

    if user.nil?
      return
    end

    can :create, Blog

    if user.is? :admin
      can :manage, :all
    end
  end
end
