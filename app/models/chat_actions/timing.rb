module ChatActions
  class Timing < ChatAction
    validates :trigger, :content, presence: true
    validate :check_trigger

    before_save :strip_content

    def strip_content
      self.content = content.strip
      self.trigger = trigger.strip
    end

    def check_trigger
      trigger_cron
    rescue => e
      errors.add(:trigger, "填写的时间格式不支持")
    end

    def can_trigger?(opts = {})
      status.online? && matched?(opts[:time])
    end

    def next_exec_time
      ans = trigger_cron
      ans.present? ? Time.at(ans.next_time.seconds) : ''
    end

    def matched?(time)
      Fugit.do_parse(trigger, multi: true).any? {|x| x.match?(time)}
    end

    def trigger_cron
      Fugit.do_parse(trigger)
    end

    def mention_contacts
      return [] if mention.blank?

      chat_room.chat_contacts.where(contact_uid: mention)
    end

    def push_message!      
      chat_uid = chat_room.chat_uid
      payload = {
        text: content,
        mention: mention
      }
      ChatSendMessageService.new(chat_uid, 'image', {url: file_url).send! if file_url.present?
      ChatSendMessageService.new(chat_uid, 'text', payload).send!
      update(last_send_at: Time.now, error_info: nil)
    rescue => e
      update(error_info: e)
    end
  end
end