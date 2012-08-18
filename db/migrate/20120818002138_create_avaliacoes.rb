class CreateAvaliacoes < ActiveRecord::Migration
  def change
    create_table :avaliacoes do |t|
      t.integer :empresa_id
      t.boolean :status
      t.integer :usuario_id

      t.timestamps
    end
		add_index(:avaliacoes, :empresa_id)
		add_index(:avaliacoes, :usuario_id)
  end
end
