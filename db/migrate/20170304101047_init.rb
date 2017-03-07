class Init < ActiveRecord::Migration[5.0]
  def change

    create_table :friend_relations do |t|
      t.uuid :user_id, null: false, index: true
      t.uuid :friend_id, null: false, index: true
    end

    create_table :chat_rooms do |t|
      t.string :name, null: false
      t.datetime :last_communicated_at
      t.timestamps null: false
    end

    create_table :chat_room_users do |t|
      t.uuid :user_id, null: false, index: true
      t.integer :chat_room_id, null: false, index: true
    end

    create_table :messages do |t|
      t.uuid :user_id, null: false, index: true
      t.boolean :is_read, null: false, default: false
      t.integer :chat_room_id, null: false, index: true
      t.text :content, null: false
      t.timestamps null: false
    end
  end
end
