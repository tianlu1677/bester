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
require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
