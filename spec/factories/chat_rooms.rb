# == Schema Information
#
# Table name: chat_rooms
#
#  id         :bigint           not null, primary key
#  room_id    :string
#  room_topic :string
#  chat_id    :string
#  bot_id     :string
#  bot_weixin :string
#  status     :string
#  mark       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :chat_room do
    room_id { "MyString" }
    room_topic { "MyString" }
    chat_id { "MyString" }
    bot_id { "MyString" }
    bot_weixin { "MyString" }
  end
end
