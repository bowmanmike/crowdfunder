require 'test_helper'

class PledgeTest < ActiveSupport::TestCase

  setup do
    @pledge1 = FactoryGirl.create(:pledge1) #20$
    @pledge2 = FactoryGirl.create(:pledge2) #40$
    @pledge3 = FactoryGirl.create(:pledge3) #50$

    @reward1 = FactoryGirl.create(:reward1) #50$
    @reward2 = FactoryGirl.create(:reward2) #30$

    @project = FactoryGirl.create(:project)

    @project.rewards << @reward1
    @project.rewards << @reward2

  end

  # test that a pledge gets or doesn't get a reward
  test "pledge gets reward" do
    assert @pledge3.get_reward?(@project)
    assert @pledge2.get_reward?(@project)
  end

  test "pledge gets the correct reward" do
    assert @pledge3.get_reward?(@project) == @reward1
    assert @pledge2.get_reward?(@project) == @reward2
  end

  test "pledge gets no reward" do
    assert_not @pledge1.reward, @pledge1.get_reward?(@project)
  end

  # keep pledge from getting reward if unavailable
  

end
