class AddMentionToChatAction < ActiveRecord::Migration[6.1]
  def change
    add_column :chat_actions, :mention, :text, array: true, default: []
  end
end
