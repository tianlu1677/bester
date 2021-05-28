# == Schema Information
#
# Table name: chat_actions
#
#  id              :bigint           not null, primary key
#  type            :string
#  title           :string
#  chat_room_id    :integer
#  chat_contact_id :integer
#  content         :string
#  trigger         :string
#  last_send_at    :datetime
#  status          :string
#  metadata        :jsonb
#  reply_payload   :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :chat_action do
    type { "" }
    chat_room_id { 1 }
    chat_contact_id { 1 }
    content { "MyString" }
    trigger { "MyString" }
    metadata { "MyString" }
    reply_payload { "MyString" }
  end
end
