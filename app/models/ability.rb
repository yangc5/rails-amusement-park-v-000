class Ability
  include CanCan::Ability

  def initialize(user)



    # guest can only sign up
    user ||= User.new # guest user (not logged in)
      can :create, User, {id: user.id}
    if user.persisted?
      can [:update, :read], User, {id: user.id}
      can :read, Attraction
      can :take_ride, Ride
    end
    if user.admin
      can [:create, :update], Attraction
      cannot :take_ride, Ride
    end
    #    user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
