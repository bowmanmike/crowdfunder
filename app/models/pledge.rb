class Pledge < ActiveRecord::Base

  validates_presence_of :amount

  belongs_to :backer, class_name: 'User'
  belongs_to :project
  belongs_to :reward

  # method to assign award to a pledge if the pledge reaches
  # reward price threshold
  # This method works, but it doesn't get called properly when you create a pledge -- Mike
  def get_reward?(project)
    project.rewards.sort_by { |reward| reward.price }.each do |reward|
      if self.amount >= reward.price
        self.reward = reward if reward.available?
      end
    end
    self.reward
  end

end
