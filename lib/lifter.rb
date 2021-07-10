class Lifter
  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select { |membership| membership.lifter == self}
  end

  def gyms
    self.memberships.map { |membership| membership.gym }
  end

  def self.average_lift_total
    totals = all.map { |lifter| lifter.lift_total }
    totals.sum / all.length
  end

  def cost
    total_cost = self.memberships.map { |membership| membership.cost }
    total_cost.sum
  end

  def sign_up(gym, cost)
    Membership.new(cost, self, gym)
  end

end
