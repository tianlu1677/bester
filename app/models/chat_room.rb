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
  validates :room_uid, presence: true
  validates_uniqueness_of :room_uid

  enumerize :status, in: [:online, :offline], default: :online

  has_many :chat_messages, primary_key: :room_uid, foreign_key: :room_uid
  has_many :chat_actions

  def chat_contacts
    ChatContact.where('room_uids && ? ', "{#{room_uid}}")
  end

  class << self
    def parse(data)
      return if data[:roomId].blank?

      chat_room = ChatRoom.find_by(room_uid: data[:roomId])
      if chat_room.present?
        chat_room.update(room_topic: data[:roomTopic]) if chat_room.room_topic != data[:roomTopic]
        return
      end

      chat_room = ChatRoom.create(
        room_uid: data[:roomId],
        room_topic: data[:roomTopic],
        chat_uid: data[:chatId],
        bot_uid: data[:botId],
        bot_weixin: data[:botWeixin]
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
