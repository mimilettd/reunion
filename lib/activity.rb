class Activity
  attr_reader :name,
              :participants,
              :total_cost
  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(name, cost)
    participants.merge!(name => cost)
  end

  def total_cost
    @total_cost = participants.inject(0) { |sum, cost| sum += cost[1] }
  end

  def split
    total_cost / participants.count
  end
end
