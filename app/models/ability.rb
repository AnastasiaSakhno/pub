class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Category, Ingredient, Menu, Poster, Slide]
    user ||= User.new # guest user (not logged in)
    can :manage, :all if user.admin?
    can :manage, [Poster, Slide] if user.newsmaker?
    if user.employee?
      can [:read, :create], [Sale, Arrival, Order]
      can [:update, :close], Order, :status_id => Status.find_by_name(:new).id
      can :manage, [Poster, Slide]
    end
  end
end
