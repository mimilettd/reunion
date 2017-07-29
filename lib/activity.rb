class Activity
  attr_reader :name,
              :participants,
              :split
  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, paid)
    participants.merge!(name => paid)
  end

  def total_cost
    participants.inject(0) do |sum, person|
      sum + person[1]
    end
  end

  def split
    total_cost / participants.count
  end

  def owed
    amount_owed = {}
    participants.each do |key, value|
      amount_owed[key] = split - value
    end
    amount_owed
  end

end
