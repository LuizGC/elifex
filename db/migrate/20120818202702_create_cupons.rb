class CreateCupons < ActiveRecord::Migration
  def change
    create_table :cupons do |t|
      t.integer :usuario_id
      t.integer :premio_id

      t.timestamps
    end
		
		add_index(:cupons, :usuario_id)
		add_index(:cupons, :premio_id)
  end
end
