class CreateChatContacts < ActiveRecord::Migration[6.1]
  def up
    create_table :chat_contacts do |t|
      t.string :contact_uid
      t.string :contact_name
      t.string :avatar_url
      t.string :contact_type
      t.string :alias_name
      t.string :marker

      t.timestamps
    end

    add_index :chat_contacts, :contact_uid
    add_index :chat_contacts, :contact_name
  end

  def down
    drop_table :chat_contacts
  end
end
