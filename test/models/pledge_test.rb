require 'test_helper'

class PledgeTest < ActiveSupport::TestCase

  setup do
    @pledge1 = FactoryGirl.create(:pledge1)
    @pledge2 = FactoryGirl.create(:pledge2)
    @pledge3 = FactoryGirl.create(:pledge3)

    @reward1 = FactoryGirl.create(:reward1)
    @reward2 = FactoryGirl.create(:reward2)

    @project = FactoryGirl.create(:project)

    @reward1.project = @project
    @reward2.project = @project

    @pledge1.project = @project
    @pledge2.project = @project
    @pledge3.project = @project
  end

  # test that a pledge gets or doesn't get a reward
  # test that updating a pledge gets a better reward
  # keep pledge from getting reward if unavailable

end
