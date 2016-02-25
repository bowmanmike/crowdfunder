class Pledge < ActiveRecord::Base
  belongs_to :backer, class_name: 'User'
  belongs_to :project
  belongs_to :reward

  # method to assign award to a pledge if the pledge reaches
  # reward price threshold
  def get_reward?(project)
    project.rewards.sort_by { |reward| reward.price }.each do |reward|
      if self.amount >= reward.price
        self.reward = reward if reward.available?
      end
    end
    self.reward
  end

end
