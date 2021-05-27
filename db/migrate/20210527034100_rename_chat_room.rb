class RenameChatRoom < ActiveRecord::Migration[6.1]
  def change
    rename_column :chat_rooms, :room_id, :room_uid
    rename_column :chat_rooms, :chat_id, :chat_uid
    rename_column :chat_rooms, :bot_id, :bot_uid

    rename_column :chat_messages, :message_id, :message_uid
    rename_column :chat_messages, :room_id, :room_uid
    rename_column :chat_messages, :chat_id, :chat_uid
    rename_column :chat_messages, :contact_id, :contact_uid

    add_column :chat_contacts, :bot_uid, :string
    add_column :chat_contacts, :room_uids, :text, array: true, default: []
    remove_column :chat_messages, :message_type
    add_column :chat_messages, :message_type, :integer
  end
end
