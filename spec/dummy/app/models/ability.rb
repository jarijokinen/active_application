class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.has_role?(:administrator)
      can :manage, :all
    elsif user && user.has_role?(:customer)
      can :manage, Blog, user_id: user.id
      can :manage, Category, blog: {user_id: user.id}
      can :manage, Post, category: {blog: {user_id: user.id}}
      can :create, Post
      can :read, :all
    else
      can :read, :all
      can :create, Comment
    end
  end
end
