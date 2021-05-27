# frozen_string_literal: true

class ChatReplyWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: false, backtrace: true

  def perform(message_id)
    message = ChatMessage.find(message_id)
    content = message.content
    chat_uid = message.chat_uid
    ChatReplyService.new(content).reply!(chat_uid)
  end
end

# Sidekiq::Cron::Job.create(name: 'Hard worker - every 5min', cron: '*/5 * * * *', class: 'HardWorker') # execute at every 5 minutes, ex: 12:05, 12:10, 12:15...etc

# doc https://github.com/mperham/sidekiq/wiki/Getting-Started
