class Lifter
  attr_reader :name, :lift_total

  @@all = []
  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def memberships
    Membership.all.select { |memberships| memberships.lifter == self }
  end

  def gyms
    self.memberships.collect { |gyms| gyms.gym }
  end

  def membership_costs
    self.memberships.sum { |gym| gym.cost }
  end

  def gym_sign_up(gym, cost)
    Membership.new(cost, self, gym)
  end
  
  def self.average_lift_total
    total_sum = self.all.sum { |lift| lift.lift_total }
    total_sum.to_f / self.all.length
  end

  def self.all
    @@all
  end
end
