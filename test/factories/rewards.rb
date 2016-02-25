FactoryGirl.define do

  factory :reward1, class: "Reward" do
    name "Reward A"
    price 50
    description "T-Shirt and Hat"
    number_available 20
  end

  factory :reward2, class: "Reward" do
    name "Reward B"
    price 30
    description "Coffee Mug"
    number_available 20
  end

end
