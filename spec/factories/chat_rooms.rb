# == Schema Information
#
# Table name: chat_rooms
#
#  id         :bigint           not null, primary key
#  room_uid   :string
#  room_topic :string
#  chat_uid   :string
#  bot_uid    :string
#  bot_weixin :string
#  status     :string
#  mark       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :chat_room do
    room_uid { "MyString" }
    room_topic { "MyString" }
    chat_uid { "MyString" }
  end
end
