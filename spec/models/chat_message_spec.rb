# == Schema Information
#
# Table name: chat_messages
#
#  id                 :bigint           not null, primary key
#  room_id            :string
#  message_id         :string
#  chat_id            :string
#  payload            :jsonb
#  content            :text
#  message_type       :string
#  contact_name       :string
#  contact_id         :string
#  contact_avatar_url :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe ChatMessage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
