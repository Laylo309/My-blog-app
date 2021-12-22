class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    can :read, User, user: user
    can :read, Post, user: user
    can :read, Comment, user: user
    can :read, Like, user: user
    return unless user.present?

    can %i[update destroy], Post, author_id: user.id
    can %i[update destroy], Comment, author_id: user.id

    return unless user.is? :admin

    can :manage, :all
  end
end
