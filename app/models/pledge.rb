class Pledge < ActiveRecord::Base

  validates_presence_of :amount

  belongs_to :backer, class_name: 'User'
  belongs_to :project
  belongs_to :reward

  # method to assign reward to a pledge if the pledge reaches
  # reward's price threshold
  def get_reward?(project)
    max_reward = project.rewards.max_by(&:price)
    ordered_rewards = project.rewards.sort_by { |reward| reward.price }

    # if user already has the highest reward and is INCREASING their pledge,
    # no action is taken
    return if self.reward == max_reward && self.amount >= max_reward.price

    # if user has a reward already, but the increase in their pledge does
    # not take them to the next reward level, no action is taken
    if self.reward && self.reward != max_reward
      next_reward = ordered_rewards[(ordered_rewards.index(self.reward) + 1)]
      return if self.amount < next_reward.price
    end

    ordered_rewards.each do |reward| 
      if self.amount >= reward.price
        self.reward = reward if reward.available?
      end
    end
    self.reward
  end

end
