class ChatReplyService
  attr_accessor :content

  def initialize(content)
    @content = content
  end

  def reply!(chat_uid)
    type = 'text'
    payload = reply_payload
    return if content.blank? || payload.blank?

    ChatSendMessageService.new(chat_uid, type, payload).send!
  end

  def reply_payload
    if content.to_s.start_with? '查'
      search_content = content[1..].strip
      baidu_url = URI.encode("https://baidu.com/s?wd=#{search_content}")
      payload = {
        text: "百度一下: #{search_content} 👉 #{baidu_url}"
      }
    end
  end
end
