class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.is? :admin
      can :manage, :all
    else
      can :manage, Post, author_id: user.id # owner of post can perform all view, update or destroy own post if Post.author == user
      can :manage, Comment, author_id: user.id
      can :read, :all
    end
  end
end
