class CreateChatRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_rooms do |t|
      t.string :room_id
      t.string :room_topic
      t.string :chat_id
      t.string :bot_id
      t.string :bot_weixin
      t.string :status
      t.string :mark      

      t.timestamps
    end
  end
end
