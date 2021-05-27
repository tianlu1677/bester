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
  class << self
    def parse(data)      
      chat_contact = ChatContact.find_by(contact_uid: data[:contactId])
      return if chat_contact.present?

      chat_contact = ChatContact.create(
        contact_uid: data[:contactId],
        contact_name: data[:contactName],
        avatar_url: data[:avatar],
        contact_type: data[:contactType],
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

