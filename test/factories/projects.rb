FactoryGirl.define do
  factory :project, class: "Project" do
    name "A Smack-talking Lunchbox"
    funding_goal 20000
    description "Eat your celery before I whip your bitch-ass"
    end_date Time.now
  end
end
