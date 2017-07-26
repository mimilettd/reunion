class Activity
  attr_reader :name,
              :participants
  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    participants.merge!(name => cost)
  end

  def total_cost
    participants.inject(0) { |sum, cost| sum += cost[1] }
  end
end
