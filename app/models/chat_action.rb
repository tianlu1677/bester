# == Schema Information
#
# Table name: chat_actions
#
#  id              :bigint           not null, primary key
#  type            :string
#  title           :string
#  chat_room_id    :integer
#  chat_contact_id :integer
#  content         :string
#  trigger         :string
#  last_send_at    :datetime
#  status          :string
#  metadata        :jsonb
#  reply_payload   :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class ChatAction < ApplicationRecord
  belongs_to :chat_room, optional: true
  belongs_to :chat_contact, optional: true

  enumerize :status, in: [:online, :offline], default: :offline

  validates :content, :trigger, presence: true

  before_save :strip_mention, if: :mention_changed?

  has_one_attached :file

  def strip_mention
    self.mention = mention.select {|x| x.present?}
  end

  def push_message!
    puts "push_message"
  end

  def file_url
    return '' if !file.attached?
    url = "#{ENV['WEBSITE']}/#{Rails.application.routes.url_helpers.rails_blob_url(file, only_path: true)}"
    body = Faraday.get(url).body
    body.match(/http.*.(jpg|jpeg|png|gif)/).to_s
  end

  class << self
    def send_message(action_id)
      action = ChatAction.find(action_id)
      action.push_message!
    end
  end
end