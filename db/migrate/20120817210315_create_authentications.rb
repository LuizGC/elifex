class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :usuario_id
      t.string :provider
      t.string :uid
      t.string :token

      t.timestamps
    end
		add_index :authentications, :usuario_id, :unique => true
		add_index :authentications, :uid, :unique => true
		add_index :authentications, :token, :unique => true
  end
end
