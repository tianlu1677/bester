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
class ChatContact < ApplicationRecord
end
