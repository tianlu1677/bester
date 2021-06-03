class CreateChatTricks < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_tricks do |t|
      t.string :category
      t.string :title
      t.text :content      
      t.jsonb :payload, default: {}
      t.string :message_type
      t.string :trigger

      t.timestamps
    end
  end
end
