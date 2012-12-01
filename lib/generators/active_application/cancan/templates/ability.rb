class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= <%= self.cancan_model.classify %>.new
    if user
      can :read, :all
    end
  end
end
