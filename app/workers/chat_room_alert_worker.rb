# frozen_string_literal: true

class ChatRoomAlertWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: false, backtrace: true

  def perform(*_args)
    ChatRoom.all.each do |chat_room|
      type = 'text'
      payload = {
        text: "当前时间是 #{Time.now}. 当前吃饭了吗？"
      }
      ChatSendMessageService.new(chat_room.chat_uid, type, payload).send!
    end
  end
end

# Sidekiq::Cron::Job.create(name: 'Hard worker - every 5min', cron: '*/5 * * * *', class: 'HardWorker') # execute at every 5 minutes, ex: 12:05, 12:10, 12:15...etc

# doc https://github.com/mperham/sidekiq/wiki/Getting-Started
