class Activity
  attr_reader :name,
              :participants,
              :total_cost,
              :split
  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
    @split = 0
  end

  def add_participant(name, cost)
    participants.merge!(name => cost)
  end

  def total_cost
    @total_cost = participants.inject(0) { |sum, cost| sum += cost[1] }
  end

  def split
    @split = total_cost / participants.count
  end

  def owed
     participants.inject({}) { |participants, (k, v)| participants[k] = v - split; participants }
  end
end
