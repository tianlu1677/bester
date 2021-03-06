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
#  contact_name       :string
#  contact_uid        :string
#  contact_avatar_url :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  message_type       :integer
#
FactoryBot.define do
  factory :chat_message do
    room_uid { "MyString" }
    chat_uid { "MyString" }
    payload { {} }
  end
end
