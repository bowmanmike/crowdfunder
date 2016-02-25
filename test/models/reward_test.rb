require 'test_helper'

class RewardTest < ActiveSupport::TestCase

  setup do
    @reward1 = FactoryGirl.create(:reward1)
    @reward2 = FactoryGirl.create(:reward2)

    15.times do
      @reward1.pledges.create(amount: 50)
    end

    20.times do
      @reward2.pledges.create(amount: 30)
    end
  end

  test "reward is available" do
    assert @reward1.available?
  end

  test "reward is not available" do
    assert_not @reward2.available?
  end

end
