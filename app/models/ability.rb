class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can [:destroy ], Review, user_id: user.id
  end
end
