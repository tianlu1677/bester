class CreateChatMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_messages do |t|
      t.string :room_id
      t.string :message_id
      t.string :chat_id
      t.jsonb :payload
      t.text :content
      t.string :message_type
      t.string :contact_name
      t.string :contact_id      
      t.string :contact_avatar_url

      t.timestamps
    end
  end
end
