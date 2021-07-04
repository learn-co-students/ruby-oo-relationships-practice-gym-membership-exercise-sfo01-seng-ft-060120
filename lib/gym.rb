class Gym
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def memberships
    Membership.all.select { |mem| mem.gym == self }
  end

  def lifters
    self.memberships.collect { |lifter| lifter.lifter }
  end

  def lifter_names
    self.lifters.collect { |lifter| lifter.name }
  end

  def lift_total
    self.lifters.sum { |lifter| lifter.lift_total }
  end

  def self.all
    @@all
  end
end
