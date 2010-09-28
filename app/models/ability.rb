class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Article, Match, Blog, Album, Player, Video, Award, Partner, Page, Team, Event, OkPlayer]
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

    can :create, [Blog, Album, Video, ArticleComment, Article]
    can :comment, Article
    can :rate, Article

    if user.is? :news_writer
      can :manage, Article
      can :destroy, [Blog, Video, Album]
    end

    if user.is? :insider

    end

    if user.is? :admin
      can :manage, :all
    end
  end
end
