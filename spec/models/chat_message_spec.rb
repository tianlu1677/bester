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
require 'rails_helper'

RSpec.describe ChatMessage, type: :model do
  describe "create" do
    it "create success" do
      FactoryBot.create(:chat_message)
    end
  end
end
