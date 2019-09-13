FactoryBot.define do
  factory :unread_msg do
    user { build(:user) }
    room { build(:room) }
    msg { build(:msg, user: user, room: room) }
  end
end
