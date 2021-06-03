# == Schema Information
#
# Table name: chat_tricks
#
#  id           :bigint           not null, primary key
#  category     :string
#  title        :string
#  content      :text
#  payload      :jsonb
#  message_type :string
#  trigger      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ChatTrick < ApplicationRecord
  # enumerize :category, in: [:text, :image, :video, :miniprogram, :link], default: :text
  store_accessor :payload, :link_url, :link_title, :link_desc, :mini_path, :mini_title, :mini_desc

  has_one_attached :file

  validates :category, presence: true
  
  def file_url
    return '' if !file.attached?
    url = "#{ENV['WEBSITE']}/#{Rails.application.routes.url_helpers.rails_blob_url(file, only_path: true)}"
    body = Faraday.get(url).body
    body.match(/http.*.(jpg|jpeg|png|gif)/).to_s
  end

  def raw_file_url
    return '' if !file.attached?
    url = "#{ENV['WEBSITE']}/#{Rails.application.routes.url_helpers.rails_blob_url(file, only_path: true)}"
  end
end
