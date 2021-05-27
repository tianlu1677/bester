# == Schema Information
#
# Table name: chat_messages
#
#  id                 :bigint           not null, primary key
#  room_uid           :string
#  message_uid        :string
#  chat_uid           :string
#  payload            :jsonb
#  content            :text
#  message_type       :string
#  contact_name       :string
#  contact_uid        :string
#  contact_avatar_url :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
FactoryBot.define do
  factory :chat_message do
    room_id { "MyString" }
    chat_id { "MyString" }
    payload { "" }
    content { "MyText" }
    type { "" }
    contact_name { "MyString" }
    contact_id { "MyString" }
    contact_avatar_url { "MyString" }
  end
end
