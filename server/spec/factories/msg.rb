FactoryBot.define do
  factory :msg do
    content { "hello world" }
    user { build(:user) }
    room { build(:room) }
  end
end
