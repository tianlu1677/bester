class CreateChatTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_templates do |t|
      t.jsonb :payload, default: {}
      t.string :title

      t.timestamps
    end
  end
end
