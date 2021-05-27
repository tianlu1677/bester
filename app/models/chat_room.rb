# == Schema Information
#
# Table name: chat_rooms
#
#  id         :bigint           not null, primary key
#  room_uid   :string
#  room_topic :string
#  chat_uid   :string
#  bot_uid    :string
#  bot_weixin :string
#  status     :string
#  mark       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ChatRoom < ApplicationRecord

  class << self
    def parse(data)
      return if data[:roomId].blank?

      chat_room = ChatRoom.find_by(room_uid: data[:roomId])
      return if chat_room.present?

      chat_room = ChatRoom.create(
                  room_uid: data[:roomId],
                  room_topic: data[:roomTopic],
                  chat_uid: data[:chatId],
                  bot_uid: data[:botId],
                  bot_weixin: data[:botWeixin]
      )
    end
  end

  def send_message_alert
    url = "https://ex-api.botorange.com/message/send"
    token = "60ae2102b0e786003f0e18fa"
    data = {
      "chatId": chat_uid,
      "token": token,
      "messageType": 0,# // MessageType, check below
      "payload": {
        "text": "当前时间是 #{Time.now}, 今天饮食怎么样？",
        "mention": [], #// mention list, nullable, you can only set it when you send text message to room,
      }
    }

    RestClient.post(url, data.to_json, {content_type: :json, accept: :json})
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
