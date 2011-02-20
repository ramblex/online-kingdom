class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Article, Match, Blog, Album, Player, Video, Award, Partner, Page, Team, Event, OkPlayer, Stream, Group]
    can :show, User
    can :home, Article
    can :unapproved, Article

    if user.nil?
      return
    end

    ## Regular users

    # Update their own profile
    can :update, User do |u|
      u && u.id == user.id
    end

    # Update their own comment
    can :update, Comment do |c|
      c && c.user.id == user.id
    end

    can [:read, :update], Message do |m|
      m && (m.from_id == user.id or m.receiver_id == user.id)
    end

    # Users can reply to messages that they receive
    can :reply, Message do |m|
      m && (m.receiver_id == user.id)
    end

    can :create, [Blog, Album, Video, Comment, Article, Message]
    can :comment, [Article, Blog, Match, Event, Video, Album]
    can :rate, Article

    if user.is? :news_writer
      can :manage, Article
      can :destroy, [Blog, Video, Album]
    end

    if user.is? :insider

    end

    if user.is? :events_admin
      can :manage, [Team, Player, Event, Match]
    end

    if user.is? :admin
      can :manage, :all
    end
  end
end
