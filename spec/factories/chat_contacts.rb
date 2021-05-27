# == Schema Information
#
# Table name: chat_contacts
#
#  id           :bigint           not null, primary key
#  contact_uid  :string
#  contact_name :string
#  avatar_url   :string
#  contact_type :string
#  alias_name   :string
#  marker       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  bot_uid      :string
#  room_uids    :text             default([]), is an Array
#
FactoryBot.define do
  factory :chat_contact do
    contact_uid { "xxx" }
    contact_name { "A1" }
  end
end
