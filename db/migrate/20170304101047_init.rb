class Init < ActiveRecord::Migration[5.0]
  def change

    create_table :chat_room do |t|
      t.string :name, null: false
      t.datetime :last_communicated_at
      t.timestamps null: false
    end

    create_table :chat_room_users do |t|
      t.uuid :user_id, null: false, index: true
      t.integer :chat_room_id, null: false, index: true
    end
  end
end
