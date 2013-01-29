module ActiveApplication
  class Ability
    include CanCan::Ability

    def initialize(user)
      if user.has_role?(:administrator)
        administrator_abilities
      elsif user.has_role?(:customer)
        customer_abilities
      else
        public_abilities
      end
    end

    private

    def administrator_abilities
      can :manage, :all
    end

    def customer_abilities
    end

    def public_abilities
    end
  end
end
