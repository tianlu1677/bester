# frozen_string_literal: true

class ChatActionTimingCheckWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: false, backtrace: true

  def perform()
    # 每分钟运行一次
    current_time = Time.now.strftime("%Y-%m-%d %H:%M")
    chat_rooms = ChatRoom.where(status: :online)
    chat_rooms.each do |chat_room|
      chat_room.chat_actions.each do |chat_action|
        next if !chat_action.can_trigger?(time: current_time)

        ChatAction.delay(retry: false).send_message(chat_action.action_id)
      end  
    end
  end
end

# Sidekiq::Cron::Job.create(name: 'Hard worker - every 5min', cron: '*/5 * * * *', class: 'HardWorker') # execute at every 5 minutes, ex: 12:05, 12:10, 12:15...etc

# doc https://github.com/mperham/sidekiq/wiki/Getting-Started
