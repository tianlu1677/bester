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
#
FactoryBot.define do
  factory :chat_contact do
    contact_id { "MyString" }
    contact_name { "MyString" }
    avatar_url { "MyString" }
    contact_type { "MyString" }
    alias_name { "MyString" }
    marker { "MyString" }
  end
end
