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
#  message_type       :string
#  contact_name       :string
#  contact_uid        :string
#  contact_avatar_url :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe ChatSendMessageService, type: :model do
  describe 'build payload' do
    before(:each) do
      # WebMock.allow_net_connect!
      @chat_uid = '60ae69cbf630f1dd87b84b46'
    end
    it 'create text payload' do
      payload = {
        text: 'good',
        mention: ['7881299600138306']
      }
      service = ChatSendMessageService.new(@chat_uid, 'text', payload)
      data = service.build_send_payload
      service.send!

      expect(data[:payload]).to eq payload
    end

    it 'create image' do
      payload = {
        url: 'https://s3.cn-north-1.amazonaws.com.cn/xiaoju-material/public/rc-upload-1585297566308-2_1585297937120_%E4%BC%81%E4%B8%9A%E5%BE%AE%E4%BF%A1%E7%BE%A4%E5%8F%91%E5%9B%BE(1).png'
      }
      service = ChatSendMessageService.new(@chat_uid, 'image', payload)
      data = service.build_send_payload
      service.send!

      expect(data[:payload]).to eq payload
    end

    it 'create link' do
      payload = {
        sourceUrl: 'http://mp.weixin.qq.com/s?__biz=MzA3MTA0ODYyOA==&mid=2651161429&idx=1&sn=30ee392b35dc2ac91b9408e3b25dc196&chksm=84c2af8eb3b526986e242cff11e11697dd54350a1b6bfff6082c7973fb51f170876b201bc690&mpshare=1&scene=1&srcid=&sharer_sharetime=1586011571343&sharer_shareid=fc884800739cdc7215d6a289dd736e76#rd',
        title: '中国顶尖的技术社区们在一个群里，会聊什么',
        summary: '微软加入群聊并发布一条重磅消息',
        imageUrl: 'https://mp.weixin.qq.com/mp/qrcode?scene=10000004&size=102&__biz=MzA3MTA0ODYyOA==&mid=2651161429&idx=1&sn=30ee392b35dc2ac91b9408e3b25dc196&send_time='
      }
      service = ChatSendMessageService.new(@chat_uid, 'link', payload)
      data = service.build_send_payload
      service.send!

      expect(data[:payload]).to eq payload
    end

    it 'can create file' do
      payload = {
        name: '句子互动引流获客',
        url: 'https://s3.cn-northwest-1.amazonaws.com.cn/xiaoju-message-payload-bucket/message/5cd4dbbf454e8b4cc7b4c496/1576906142438/%E5%8F%A5%E5%AD%90%E7%A7%92%E5%9B%9E%E4%BA%A7%E5%93%81%E4%BB%8B%E7%BB%8D.pdf'
      }
      service = ChatSendMessageService.new(@chat_uid, 'file', payload)
      data = service.build_send_payload
      service.send!

      expect(data[:payload]).to eq payload
    end

    it 'miniprogram' do
      payload = {
        appid: 'wxfe0e405895cafdf9',
        description: '查看自己健康', # optional, can be empty string
        pagePath: 'pages/stat/index.html',
        thumbKey: '', # optional, can be empty
        iconUrl: 'https://s3.cn-north-1.amazonaws.com.cn/xiaoju-material/public/rc-upload-1585297566308-2_1585297937120_%E4%BC%81%E4%B8%9A%E5%BE%AE%E4%BF%A1%E7%BE%A4%E5%8F%91%E5%9B%BE(1).png', # MiniProgram icon
        thumbUrl: 'https://s3.cn-north-1.amazonaws.com.cn/xiaoju-material/public/rc-upload-1585297566308-2_1585297937120_%E4%BC%81%E4%B8%9A%E5%BE%AE%E4%BF%A1%E7%BE%A4%E5%8F%91%E5%9B%BE(1).png', # MiniProgram thumbnail
        title: '北京健康宝',
        username: 'gh_e3b81975fe3c@app'
      }
      service = ChatSendMessageService.new(@chat_uid, 'miniprogram', payload)
      data = service.build_send_payload
      service.send!

      expect(data[:payload]).to eq payload
    end
  end
end
