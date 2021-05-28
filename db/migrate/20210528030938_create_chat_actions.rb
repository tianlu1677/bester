class CreateChatActions < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_actions do |t|
      t.string :type
      t.string :title
      t.integer :chat_room_id
      t.integer :chat_contact_id
      t.string :content
      t.string :trigger
      t.datetime :last_send_at
      t.string :status
      t.jsonb :metadata
      t.jsonb :reply_payload
      t.text :error_info

      t.timestamps
    end
  end
end
