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
require 'rails_helper'

RSpec.describe ChatAction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
