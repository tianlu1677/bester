class ChatSendMessageService
  URL = 'https://ex-api.botorange.com/message/send'
  TOKEN = '60ae2102b0e786003f0e18fa'

  attr_accessor :chat_uid, :type, :payload

  def initialize(chat_uid, type = 'text', payload = {})
    @chat_uid = chat_uid
    @payload = payload
    @type = type
  end

  def send!
    data = build_send_payload
    
    body = request(data)

    if body[:code] == 0
      chat_room = ChatRoom.find_by(chat_uid: chat_uid)
      message_type = find_receive_type(type)
      ChatMessage.create(
        room_uid: chat_room&.room_uid,
        chat_uid: chat_uid,
        message_type: message_type,
        message_uid: SecureRandom.uuid,
        payload: payload,
        contact_name: '机器人'
      )
    else
      Rails.logger.info('未发送成功!')
    end
  end

  def build_send_payload
    {
      messageType: build_msg_type(type),
      chatId: chat_uid,
      token: TOKEN,
      payload: payload
    }
  end

  def find_receive_type(type)
    {
      'text' => 7,
      'image' => 6,
      'link' => 12,
      'file' => 1,
      'miniprogram' => 9,
      'video' => 13
    }[type]
  end

  def build_msg_type(type)
    {
      'text' => 0,
      'image' => 1,
      'link' => 2,
      'file' => 3,
      'miniprogram' => 4,
      'video' => 5
    }[type]
  end

  # {
  #   "code": 0,
  #   "message": "",
  #   "data": {
  #     "requestId": ""
  #   }
  # }
  def request(data)
    Rails.logger.info("send data #{data}")
    res = RestClient.post(URL, data.to_json, { content_type: :json, accept: :json })
    body = JSON.load(res.body)
    Rails.logger.info("send answer body #{body}")
    body.deep_symbolize_keys
  end
end

# text
# {
#   "chatId": "5e38ef8054eed1179f904f8e",
#   "token": "5df7649ae44570065a78f337",
#   "messageType": 0, // MessageType, check below
#   "payload": {
#     "text": "Hello World",
#     "mention": [], // mention list, nullable, you can only set it when you send text message to room,
#   }
# }
#
# image
#  "payload": {
#    "url": "https://s3.cn-north-1.amazonaws.com.cn/xiaoju-material/public/rc-upload-1585297566308-2_1585297937120_%E4%BC%81%E4%B8%9A%E5%BE%AE%E4%BF%A1%E7%BE%A4%E5%8F%91%E5%9B%BE(1).png",
#    "size": 1024, // image size, nullable
#  }
#
#  link
#  "payload": {
#    "sourceUrl": "http://mp.weixin.qq.com/s?__biz=MzA3MTA0ODYyOA==&mid=2651161429&idx=1&sn=30ee392b35dc2ac91b9408e3b25dc196&chksm=84c2af8eb3b526986e242cff11e11697dd54350a1b6bfff6082c7973fb51f170876b201bc690&mpshare=1&scene=1&srcid=&sharer_sharetime=1586011571343&sharer_shareid=fc884800739cdc7215d6a289dd736e76#rd",
#    "title": "中国顶尖的技术社区们在一个群里，会聊什么",
#    "summary": "微软加入群聊并发布一条重磅消息",
#    "imageUrl": "https://mp.weixin.qq.com/mp/qrcode?scene=10000004&size=102&__biz=MzA3MTA0ODYyOA==&mid=2651161429&idx=1&sn=30ee392b35dc2ac91b9408e3b25dc196&send_time=",
#  }
#
#   "payload": {
#    "name": "句子互动引流获客",
#    "url": "https://s3.cn-northwest-1.amazonaws.com.cn/xiaoju-message-payload-bucket/message/5cd4dbbf454e8b4cc7b4c496/1576906142438/%E5%8F%A5%E5%AD%90%E7%A7%92%E5%9B%9E%E4%BA%A7%E5%93%81%E4%BB%8B%E7%BB%8D.pdf",
#    "size": 1024, // file size, nullable
#  }
#
#  "payload": {
#    "appid": "wxfe0e405895cafdf9",
#    "description": "", // optional, can be empty string
#    "pagePath": "pages/stat/index.html",
#    "thumbKey": "", // optional, can be empty
#    "iconUrl": "https://s3.cn-north-1.amazonaws.com.cn/xiaoju-material/public/rc-upload-1585297566308-2_1585297937120_%E4%BC%81%E4%B8%9A%E5%BE%AE%E4%BF%A1%E7%BE%A4%E5%8F%91%E5%9B%BE(1).png", // MiniProgram icon
#    "thumbUrl": "https://s3.cn-north-1.amazonaws.com.cn/xiaoju-material/public/rc-upload-1585297566308-2_1585297937120_%E4%BC%81%E4%B8%9A%E5%BE%AE%E4%BF%A1%E7%BE%A4%E5%8F%91%E5%9B%BE(1).png", // MiniProgram thumbnail
#    "title": "北京健康宝",
#    "username": "gh_e3b81975fe3c@app",
#  }
