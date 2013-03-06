class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Category, Ingredient, Menu, Poster, Slide]
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :employee
      can [:read, :create], Sale
    end
  end
end
