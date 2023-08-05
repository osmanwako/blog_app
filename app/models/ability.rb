class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :create, [Post, Comment]

    if user.role == 'admin'
      can :manage, :all
    else
      can :destroy, Post, author_id: user.id
      can :destroy, Comment, user_id: user.id
    end
  end
end
