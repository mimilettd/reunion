class Reunion
  attr_reader :name,
              :activities,
              :total_cost
  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    activities << activity
  end

  def total_cost
    total = 0
    activities.each do |activity|
      activity.participants.values.each do |value|
        total += value
      end
    end
    total
  end

  def breakout
    breakout_money = {}
    total_owed = 0
    activities.each do |activity|
      activity.owed.each do |key, owe|
        if breakout_money.has_key?(key)
          breakout_money[key] = breakout_money[key] + owe
        else breakout_money[key] = total_owed + owe
        end
      end
    end
    breakout_money
  end

end
