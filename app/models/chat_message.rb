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
class ChatMessage < ApplicationRecord

  class << self
    def parse(data)      
      chat_message = ChatMessage.find_by(message_id: data[:messageId])
      return if chat_message.present?

      chat_room = ChatMessage.create(
                  room_id: data[:roomId],
                  message_id: data[:messageId],
                  chat_id: data[:chatId],
                  payload: data[:payload],
                  # content: data[:payload],
                  message_type: data[:type],
                  contact_name: data[:contactName],
                  contact_id: data[:contactId],
                  contact_avatar_url: data[:avatar],
      )      
    end
  end
end

# {
#   "data": {
#     "messageId": "1000703",
#     "chatId": "60ae24d7f630f1dd8745eb86",
#     "avatar": "https://wx.qlogo.cn/mmhead/sstLNDibp2U6z4xZsGNcURjBt1UbKqHiccxYjcdibZTAkCAZnKbSfEe8g/0",
#     "roomTopic": "晨曦,句子小秘",
#     "roomId": "R:10696050465026800",
#     "contactName": "晨曦",
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
#       "roomTopic": "晨曦,句子小秘",
#       "roomId": "R:10696050465026800",
#       "contactName": "晨曦",
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