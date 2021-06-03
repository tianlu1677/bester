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
FactoryBot.define do
  factory :chat_trick do
    category { "MyString" }
    title { "MyString" }
    content { "MyText" }
    payload { "MyString" }
    message_type { "MyString" }
    trigger { "MyString" }
  end
end
