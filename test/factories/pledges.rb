FactoryGirl.define do
  factory :pledge, class: "Pledge" do
    amount 20
  end

  factory :pledge, class: "Pledge" do
    amount 50
  end

  factory :reward, class: "Reward" do
    name "Reward A"
    price 50
    description "T-Shirt and Hat"
    number_available 20
  end

end
