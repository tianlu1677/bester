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
class ChatMessage < ApplicationRecord
  belongs_to :chat_room, foreign_key: :room_uid, primary_key: :room_uid, optional: true

  after_create_commit :boardcast_message_receive

  def boardcast_message_receive
    ChatReplyWorker.perform_async(id)
    # ChatReplyService.new(content).reply!(chat_uid)
  end

  class << self
    def parse(data)
      chat_message = ChatMessage.find_by(message_uid: data[:messageId])
      return if chat_message.present?

      content = data.dig(:payload, :text)
      ChatMessage.create!(room_uid: data[:roomId],
                          message_uid: data[:messageId],
                          chat_uid: data[:chatId],
                          payload: data[:payload],
                          content: content,
                          contact_avatar_url: data[:avatar],
                          message_type: data[:type],
                          contact_name: data[:contactName],
                          contact_uid: data[:contactId])
    end
  end

  MSG_TYPE = {
    1 => 'attachment',
    2 => 'audio',
    3 => 'contact',
    4 => 'chatHistory',
    5 => 'emoticon',
    6 => 'image',
    7 => 'text',
    8 => 'location',
    9 => 'miniprogram',
    10 => 'money',
    11 => 'recalled',
    12 => 'link',
    13 => 'video',
    9999 => 'roomoinvitation',
    10_000 => 'system',
    10_001 => 'wechatsystem'
  }
end

# {
#   "data": {
#     "messageId": "1000703",
#     "chatId": "60ae24d7f630f1dd8745eb86",
#     "avatar": "https://wx.qlogo.cn/mmhead/sstLNDibp2U6z4xZsGNcURjBt1UbKqHiccxYjcdibZTAkCAZnKbSfEe8g/0",
#     "roomTopic": "??????,????????????",
#     "roomId": "R:10696050465026800",
#     "contactName": "??????",
#     "contactId": "7881299600138306",
#     "payload": {
#       "text": "Hbh"
#     },
#     "type": 7,
#     "timestamp": 1622039616240,
#     "token": "60ae2102b0e786003f0e18fa",
#     "contactType": 1,
#     "coworker": false,
#     "botId": "60ae1ff1538d81003f464192",
#     "botWxid": "1688852023054069",
#     "botWeixin": "Yu"
#   },
#   "controller": "messages",
#   "action": "message",
#   "message": {
#     "data": {
#       "messageId": "1000703",
#       "chatId": "60ae24d7f630f1dd8745eb86",
#       "avatar": "https://wx.qlogo.cn/mmhead/sstLNDibp2U6z4xZsGNcURjBt1UbKqHiccxYjcdibZTAkCAZnKbSfEe8g/0",
#       "roomTopic": "??????,????????????",
#       "roomId": "R:10696050465026800",
#       "contactName": "??????",
#       "contactId": "7881299600138306",
#       "payload": {
#         "text": "Hbh"
#       },
#       "type": 7,
#       "timestamp": 1622039616240,
#       "token": "60ae2102b0e786003f0e18fa",
#       "contactType": 1,
#       "coworker": false,
#       "botId": "60ae1ff1538d81003f464192",
#       "botWxid": "1688852023054069",
#       "botWeixin": "Yu"
#     }
#   }
# }
