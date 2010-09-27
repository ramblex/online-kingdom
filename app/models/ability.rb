class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Article, Match, Blog, Album, Player, Video, Award, Partner, Page, Team, Event, OkPlayer]
    can :show, User

    if user.nil?
      return
    end

    can :update, User do |u|
      u && u.id == user.id
    end

    can [:update, :delete], Player do |p|
      p && p.user_id == user.id
    end

    can :create, Blog

    if user.is? :events_staff
      can :create, Player
    end

    if user.is? :admin
      can :manage, :all
    end
  end
end
